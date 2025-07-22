module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id                = module.vpc.vpc_id
  name_prefix           = "devops"
  public_route_table_id = module.vpc.public_route_table_id

  az_a = "us-east-1a"
  az_b = "us-east-1b"

  public_subnet_cidr_a  = "10.0.1.0/24"
  public_subnet_cidr_b  = "10.0.2.0/24"
  private_subnet_cidr_a = "10.0.3.0/24"
  private_subnet_cidr_b = "10.0.4.0/24"
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  public_subnet_id  = module.subnets.public_subnet_ids[0]
  private_subnet_id = module.subnets.private_subnet_ids[0]
  key_name          = var.key_name
  name_prefix       = var.name_prefix
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "lecture30-cluster"
  subnet_ids   = module.subnets.public_subnet_ids
  vpc_id       = module.vpc.vpc_id
}
