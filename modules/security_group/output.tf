output "private_instance_security_group_ids" {
  value = [aws_security_group.private_instance.id]
}

