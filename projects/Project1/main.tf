terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

# Modules
module "vpc" {
  source   = "../../modules/vpc"
  cidr_vpc = "10.0.0.0/16"
}

module "subnets" {
  source    = "../../modules/subnets"
  vpc_id    = module.vpc.vpc_id
  range1    = "10.0.10.0/24"
  range2    = "10.0.20.0/24"
  range3    = "10.0.100.0/24"
  range4    = "10.0.200.0/24"
  zones1    = "us-east-1a"
  zones2    = "us-east-1b"
}

module "internet_gateway" {
  source = "../../modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "eip" {
  source = "../../modules/eip"
}

module "nat_gateway" {
  source = "../../modules/nat_gateway"
  eip1_id            = module.eip.eip1_id
  eip2_id            = module.eip.eip2_id
  public_subnet1_id  = module.subnets.public_subnet1_id
  public_subnet2_id  = module.subnets.public_subnet2_id
}

module "route_table" {
  source = "../../modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  natgw1_id = module.nat_gateway.natgw1_id
  natgw2_id = module.nat_gateway.natgw2_id
  public_subnet1_id  = module.subnets.public_subnet1_id
  public_subnet2_id  = module.subnets.public_subnet2_id
  private_subnet1_id = module.subnets.private_subnet_ids[0]
  private_subnet2_id = module.subnets.private_subnet_ids[1]
  cidr1 = "0.0.0.0/0"
  cidr2 = "10.0.0.0/16"
}

module "security_group" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
  cidr4  = "0.0.0.0/0"
}

module "elb" {
  source = "../../modules/elb"
  vpc_id = module.vpc.vpc_id
  alb_sg_id = module.security_group.alb_security_group_id
  public_subnet_ids = module.subnets.public_subnet_ids
  dereg_delay = 10
}

module "iam" {
  source = "../../modules/iam"
}

module "template" {
  source = "../../modules/template"
  instance_type        = "t3.micro"
  private_subnet_ids   = module.subnets.private_subnet_ids
  target_group_arn     = module.elb.target_group_arn
  instance_profile_name = module.iam.instance_profile_name
  web_sg_id             = module.security_group.web_security_group_id
}

