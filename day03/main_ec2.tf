teffaform{
    required_provider{
        aws={
            source="hashicorp/aws"
            version="~>4.16"
        }
    }
    required_version=">=1.20"
}

# cloud provider detain
provider "aws" {
  access_key = "<your-access-key>"
  secret_access_key = "<your-secret-access-key>"
  region = "<your-preferred-region>"
}

# Create an EC2 instance
resource "aws_instance" "my_ec2_instance" {
  count = 2
  ami = "<your-ami-id>"
  instance_type = "t2.micro"
  key_name = "<your-key-pair-name>"

  # Specify security group(s)
  vpc_security_group_ids = ["<your-security-group-id>"]

  # Configure networking
  subnet_id = "<your-subnet-id>"
  associate_public_ip_address = true

  # Define tags
  tags = {
    Name = "my-instance"
    Environment = "Production"
  }
}