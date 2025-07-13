import boto3
import time

TAG_NAME = "EC2WithS3Access"
REGION = 'us-east-1'
S3_BUCKET = 'varungweb1-sync'

ec2 = boto3.client("ec2", region_name=REGION)
ssm = boto3.client('ssm', region_name=REGION)

# 🔍 Find EC2 instance ID by tag
instances = ec2.describe_instances(
    Filters=[
        {"Name": "tag:Name", "Values": [TAG_NAME]},
        {"Name": "instance-state-name", "Values": ["running"]}
    ]
)

INSTANCE_ID = instances['Reservations'][0]['Instances'][0]['InstanceId']
print(f"✅ Found EC2 Instance ID: {INSTANCE_ID}")

commands = [
    "sudo apt update -y",
    "cd /home/ubuntu/",
    "chmod +x install-docker.sh",
    "bash install-docker.sh",
    "sudo apt install -y nginx",
    "aws s3 cp s3://{}/index.html /tmp/index.html".format(S3_BUCKET),
    "sudo rm -f /var/www/html/index.nginx-debian.html",  # remove default
    "sudo cp /tmp/index.html /var/www/html/index.html",
    "sudo chown www-data:www-data /var/www/html/index.html",
    "sudo chmod 644 /var/www/html/index.html",
    "sudo systemctl restart nginx",
    "echo 'Deployed custom index.html from S3' > /tmp/deploy_log.txt"
]


response = ssm.send_command(
    InstanceIds=[INSTANCE_ID],
    DocumentName="AWS-RunShellScript",
    Parameters={"commands": commands},
)

command_id = response['Command']['CommandId']
time.sleep(5)  # wait a few seconds

output = ssm.get_command_invocation(
    CommandId=command_id,
    InstanceId=INSTANCE_ID
)

print("📦 Command Output:\n", output.get("StandardOutputContent", "No Output"))
print("❗ Errors:\n", output.get("StandardErrorContent", "No Errors"))

print("✅ NGINX setup & S3 sync sent via SSM.")



logs = boto3.client('logs', region_name=REGION)
log_group = '/ec2/deploy-logs'
log_stream = INSTANCE_ID

# Ensure log group exists
try:
    logs.create_log_group(logGroupName=log_group)
except logs.exceptions.ResourceAlreadyExistsException:
    pass

# Create log stream
try:
    logs.create_log_stream(logGroupName=log_group, logStreamName=log_stream)
except logs.exceptions.ResourceAlreadyExistsException:
    pass

logs.put_log_events(
    logGroupName=log_group,
    logStreamName=log_stream,
    logEvents=[{
        'timestamp': int(time.time() * 1000),
        'message': 'Post-deployment script executed successfully.'
    }]
)
