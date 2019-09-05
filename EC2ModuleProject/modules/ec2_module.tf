variable "vpi_id" {
    type = "string"
    default = "vpc-553b412f"
}
variable "ami_id" {
    type = "string"
    default = "ami-0b898040803850657"
}
resource "aws_security_group" "terraform_ec2_sg" {
  name        = "terraform_ec2_sg"
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

resource "aws_instance" "terraform_ec2" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.terraform_ec2_sg.id}"]
  key_name = "terraform-test"
  tags = {
    Name = "EC2 instance by Terraform"
  }
}