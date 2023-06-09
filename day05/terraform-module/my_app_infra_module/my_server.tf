resource "aws_instance" "my_instance" {
    count = 2
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "${var.my_env}-batch-3-app-server"
    }
}
