#This is not a full code, its just an example of provisioners. 

resource "aws_instance" "my-instance" {
  ami           = "ami-0c94855ba95b798c7"
  instance_type = "t2.micro"

  key_name = "my_new_key_pair"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}