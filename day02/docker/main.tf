terraform {
  required_providers {
    docker {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "example_nginx_image" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "example_nginx-container" {
  image = docker_image.example_nginx_image.name
  name  = "nginx-container"
  ports {
    internal = 80
    external = 80
  }
}

