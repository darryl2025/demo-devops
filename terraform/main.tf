##############################################
#              CONFIGURATION TERRAFORM       #
##############################################

terraform {
  required_version = ">= 1.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

##############################################
#                 PROVIDER DOCKER            #
##############################################

provider "docker" {
  host = "npipe:////./pipe/docker_engine"   # Windows
  # host = "unix:///var/run/docker.sock"    # Linux/Mac
}

##############################################
#               DOCKER IMAGE                 #
##############################################

resource "docker_image" "app" {
  name         = var.docker_image
  keep_locally = false
}

##############################################
#              DOCKER CONTAINER              #
##############################################

resource "docker_container" "app" {
  name  = "demo-devops-container"
  image = docker_image.app.image_id

  ports {
    internal = var.container_port
    external = var.host_port
  }

  restart = "unless-stopped"

  labels {
    label = "managed-by"
    value = "terraform"
  }

  labels {
    label = "project"
    value = "demo-devops"
  }
}