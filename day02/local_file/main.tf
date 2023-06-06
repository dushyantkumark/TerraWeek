# block and arguments

resource "local_file" "local-example" {
  filename = "dushyant.txt"
  content  = "Hey this is Dushyant: CLOUD & DEVOPS ENGINEER "
}

#resource = block
#random = provider
#string = provider resource type

resource "random_string" "example_string" {
  length = 15
}


output "example_string" {
  value = random_string.example_string[*].result
}



