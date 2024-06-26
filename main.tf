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

// Module for VPC resources

module "vpc" {
  source = "./vpc"
}

// Module for Autoscaling resources

module "autoscaling" {
  source = "./autoscaling"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

