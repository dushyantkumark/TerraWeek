provider "aws" {
    region = "aws-east-1"
}

resource "aws_instance" "my_ec2_instance" {
  ami_id = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  tags = {
    Name = "my-first-ec2-instance"
  }
}