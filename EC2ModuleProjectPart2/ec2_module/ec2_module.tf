variable "ami_id" {
    type = "string"
    default = "ami-0b898040803850657"
}

variable "sg_id" {}

variable "ec2_name" {}

resource "aws_instance" "terraform_ec2" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${var.sg_id}"]
  key_name = "terraform-test"
  tags = {
    Name = "${var.ec2_name}"
  }
}