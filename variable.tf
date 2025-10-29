variable "vpc_name" {
  type = string
  default = my_vpc
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = map(object({ cidr_block = string }))
}

variable "private_subnets" {
  type        = map(object({ cidr_block = string }))
}

variable "instance_name" {
  type        = string
  default     = "my_instance"
}

