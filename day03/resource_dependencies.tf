#This is not a full code, its just an example of resource_dependencies. 
resource "aws_security_group" "sg-example" {
  name = "my-sg"
}

resource "aws_instance" "my-instance" {
  ami           = "ami-0c94855ba95b798c7"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.sg-example.id}"]

  depends_on = [aws_security_group.sg-example]
}