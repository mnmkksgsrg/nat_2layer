resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr_block
  availability_zone = each.key
}

resource "aws_route_table" "public" {
  vpc_id  = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

recource "aws_route_table_association" "public" {
  for_each  = aws_subnet.public

  subnet_id = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id = aws_vpc.this.id
  cidr_block = each.value.cidr_block
  availability_zone = each.key
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0"
    nat_gateway_id = var.nat_gateway_id 
  }
}

recource "aws_route_table_association" {
  for_each = aws_subnet_private

  subnet_id = each.value.id
  route_table_id = aws_route_table.private.id
}



