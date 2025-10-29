variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string 
}

variable "public_subnets" {
  type = map(object({ cidr_block = string }))
  default = []
}

variable "private_subnets" {
  type = map(object({ cidr_block = string }))
  default = []
}
