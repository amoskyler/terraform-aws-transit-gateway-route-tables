module "vpc_prod" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.17.0"
  cidr_block = "172.16.0.0/16"

  attributes = ["prod"]
  context    = module.this.context

  providers = {
    aws = aws.prod
  }
}

module "subnets_prod" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.28.0"
  availability_zones      = var.availability_zones
  vpc_id                  = module.vpc_prod.vpc_id
  igw_id                  = module.vpc_prod.igw_id
  cidr_block              = module.vpc_prod.vpc_cidr_block
  nat_gateway_enabled     = false
  nat_instance_enabled    = false
  map_public_ip_on_launch = false

  attributes = ["prod"]
  context    = module.this.context

  providers = {
    aws = aws.prod
  }
}

module "vpc_staging" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.17.0"
  cidr_block = "172.32.0.0/16"

  attributes = ["staging"]
  context    = module.this.context

  providers = {
    aws = aws.staging
  }
}

module "subnets_staging" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.28.0"
  availability_zones      = var.availability_zones
  vpc_id                  = module.vpc_staging.vpc_id
  igw_id                  = module.vpc_staging.igw_id
  cidr_block              = module.vpc_staging.vpc_cidr_block
  nat_gateway_enabled     = false
  nat_instance_enabled    = false
  map_public_ip_on_launch = false

  attributes = ["staging"]
  context    = module.this.context

  providers = {
    aws = aws.staging
  }
}

module "vpc_dev" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.17.0"
  cidr_block = "172.48.0.0/16"

  attributes = ["dev"]
  context    = module.this.context

  providers = {
    aws = aws.dev
  }
}

module "subnets_dev" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.28.0"
  availability_zones      = var.availability_zones
  vpc_id                  = module.vpc_dev.vpc_id
  igw_id                  = module.vpc_dev.igw_id
  cidr_block              = module.vpc_dev.vpc_cidr_block
  nat_gateway_enabled     = false
  nat_instance_enabled    = false
  map_public_ip_on_launch = false

  attributes = ["dev"]
  context    = module.this.context

  providers = {
    aws = aws.dev
  }
}
