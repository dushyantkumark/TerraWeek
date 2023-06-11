# Terraform Configuration Block
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "4.67.0"
      }
    }
}
# Configure the AWS provider
provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_access_key = "YOUR_AWS_SECRET_ACCESS_KEY"
  region = "us-west-2"  # Update with your desired region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Attach the Internet Gateway to the VPC
resource "aws_vpc_attachment" "create_attachment" {
  vpc_id = aws_vpc.my_vpc.id
  internet_gateway_id = aws_internet_gateway.my_igw.id
}

# Create a security group for the EC2 instance
resource "aws_security_group" "my_sg" {
  name        = "aws-sg"
  description = "Example of security group"

  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c94855ba95c71c99"  # Update with your desired AMI
  instance_type = "t2.micro"
  key_name      = "my-new-key-pair"     # Update with your key pair

  subnet_id     = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "my-aws-instance"
  }
}