terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 5.0"
    }
  }

  required_version = ">= 1.9"
}
provider "aws" {
  region = "us-east-1" # Update with your desired AWS region
  # Add other authentication parameters if necessary
}
fffff
hmodule "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "Testing-VPC"
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  igw_name = "Testing-IG"
  vpc_id   = module.vpc.vpc_id
}
module "route_table" {
  source              = "./modules/route_table"
  route_table_name   = "Testing-Route"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id  = module.internet_gateway.internet_gateway_id
}

module "public_subnet" {
  source              = "./modules/public_subnet"
  subnet_name         = "Testing-Public"
  vpc_id              = module.vpc.vpc_id
  cidr_block          = "172.31.16.0/24"
  availability_zone   = "ap-south-1a"
  route_table_id      = module.route_table.route_table_id
}

module "security_group" {
  source  = "./modules/security_group"
  sg_name = "Testing-Security"
  vpc_id  = module.vpc.vpc_id
}

module "ec2_instance" {
  source              = "./modules/ec2"
  instance_type       = "t2.micro"
  ami                 = "ami-03f4878755434977f" // replace with your AMI
  subnet_id           = module.public_subnet.subnet_id
  security_group_ids = [module.security_group.security_group_id]
  key_pair_name        = "Terraform-Instance"
}

##module "elastic_ip_allocation" {
#  source		= "./modules/elastic_ip_allocation"
#  vpc_id                = module.vpc.vpc_id
#}
#
#module "instance_association" {
#  source      = "./modules/instance_association"
#  instance_id = module.ec2_instance.instance_id  
#  eip_id      = module.elastic_ip_allocation.elastic_ip_allocation_id
#}

#module "example_s3_bucket" {
#  source = "./modules/s3_bucket"#
#
 # bucket_name = "testingsouckmus" # Change to your desired bucket name
  #bucket_acl  = "public-read"         # Allow all public access
#}
output "Sample_page_url" {
  value = "http://${module.ec2_instance.public_ip}"
}

