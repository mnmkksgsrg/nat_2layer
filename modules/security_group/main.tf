resource "aws_security_group" "private_instance" {
  vpc_id = var.vpc_name
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.private_instance.id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.private_instance.id
  from_port = 443
  to_port = 443
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.private_instance.id
  from_port = 25
  to_port = 25
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_grop_id = aws_security_group.private_instance.id
  ip_prptocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}


