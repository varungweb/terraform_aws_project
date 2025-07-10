resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
}

# resource "aws_route_table_association" "assoc" {
#   for_each = toset(var.subnet_ids)

#   subnet_id      = each.value
#   route_table_id = aws_route_table.this.id
# }

resource "aws_route_table_association" "assoc" {
  for_each       = var.subnet_ids
  subnet_id      = each.value
  route_table_id = aws_route_table.this.id
}
