terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

// Provider configuration

provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc.tf"
}

module "internet_gateway" {
  source = "./int_gateway.tf"
  vpc_id = module.vpc.vpc_id
}

module "subnets" {
  source = "./subnets.tf"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./routetable.tf"
  vpc_id = module.vpc.vpc_id
  gateway_id = module.internet_gateway.gateway_id
}

module "route_table_association" {
  source = "./route_table_asso_public_subnets.tf"
  subnet_id = module.subnets.public_subnet_id
  route_table_id = module.route_table.route_table_id
}

module "autoscaling" {
  source = "./auto_scaling.tf"
  subnet_ids = [module.subnets.public_subnet_id]
}

