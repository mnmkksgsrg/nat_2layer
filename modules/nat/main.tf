resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.private_subnet_ids[0]
}

resource "aws_eip" "nat" {
  domain = "vpc"
}


