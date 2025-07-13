# # 1. Trust relationship
# data "aws_iam_policy_document" "ec2_trust" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

# # 2. IAM Role
# resource "aws_iam_role" "ec2_role" {
#   name               = "ec2-s3-sync-access-role"
#   assume_role_policy = data.aws_iam_policy_document.ec2_trust.json
# }

# # 3. IAM Instance Profile
# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2-s3-profile"
#   role = aws_iam_role.ec2_role.name
# }

# # 4. Attach S3 full or scoped access policy
# resource "aws_iam_role_policy_attachment" "s3_access" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
# }
