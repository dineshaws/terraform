provider "aws" {
    region = "us-east-1"
    profile = "developer"
}

module "aws_sg_module" {
    source = "./sg_module"
}

module "aws_ec2_module_1" {
    sg_id = "${module.aws_sg_module.sg_id_output}"
    ec2_name = "instance 1 from terraform module"
    source = "./ec2_module"
}

module "aws_ec2_module_2" {
    sg_id = "${module.aws_sg_module.sg_id_output}"
    ec2_name = "instance 2 from terraform module"
    source = "./ec2_module"
}