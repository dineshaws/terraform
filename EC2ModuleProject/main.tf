provider "aws" {
    region = "us-east-1"
    profile = "developer"
}

module "aws_ec2_module" {
    source = "./modules"
}