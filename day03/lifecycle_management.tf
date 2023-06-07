#This is not a full code, its just an example of resource_dependencies. 

resource "aws_instance" "my-instance" {
  ami           = "ami-0c94855ba95b798c7"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
  }
}