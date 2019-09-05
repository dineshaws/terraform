variable "vpi_id" {
    type = "string"
    default = "vpc-553b412f"
}

resource "aws_security_group" "terraform_ec2_sg_module" {
  name        = "terraform_ec2_sg_module"
  description = "terraform "
  vpc_id      = "${var.vpi_id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

output "sg_id_output" {
    value = "${aws_security_group.terraform_ec2_sg_module.id}"
}