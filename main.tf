terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}
resource "docker_image" "class_api" {
  name         = "bubbaj/it4200-fall-2026:2.49.0"
  keep_locally = true
}
resource "docker_container" "class_api" {
  image = docker_image.class_api.image_id
  name  = "terraform-class-api"

  ports {
    internal = 8000
    external = 8000
  }
}