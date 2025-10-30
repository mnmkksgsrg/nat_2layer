module "nat" {
  source = "./modules/nat"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}


module "vpc" {
  source = "./modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  nat_gateway_id  = module.nat.nat_gateway_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security_group" {
  source = "./modules/security_group"

  vpc_name = var.vpc_name
  vpc_id   = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  instance_type                       = var.instance_type
  subnet_id                           = module.vpc.private_subnet_ids[0]
  private_instance_security_group_ids = module.security_group.private_instance_security_group_ids
}


