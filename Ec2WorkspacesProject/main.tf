provider "aws" {
    region = "us-east-1"
    profile = "developer"
}

module "shared_vars" {
    source = "./shared_vars"
}

module "aws_sg_module" {
    sg_name = "sg_ec2_${module.shared_vars.env_suffix}"
    source = "./sg_module"
}

module "aws_ec2_module_1" {
    sg_id = "${module.aws_sg_module.sg_id_output}"
    ec2_name = "ec2 instance 1 ${module.shared_vars.env_suffix}"
    source = "./ec2_module"
}