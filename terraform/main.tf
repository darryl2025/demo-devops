# Configuration Terraform
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  
  # Backend pour stocker l'état (optionnel pour le TP)
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Provider Docker - pour gérer les conteneurs localement
provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Windows
  # host = "unix:///var/run/docker.sock"   # Linux/Mac (décommenter si besoin)
}

# Variable pour l'image Docker
variable "docker_image" {
  description = "Image Docker à déployer"
  type        = string
  default     = "ghcr.io/darryl2025/demo-devops:latest"
}

variable "container_port" {
  description = "Port du conteneur"
  type        = number
  default     = 80
}

variable "host_port" {
  description = "Port sur l'hôte"
  type        = number
  default     = 8080
}

# Resource: Pull de l'image Docker
resource "docker_image" "app" {
  name         = var.docker_image
  keep_locally = false
}

# Resource: Conteneur Docker
resource "docker_container" "app" {
  name  = "demo-devops-container"
  image = docker_image.app.image_id
  
  ports {
    internal = var.container_port
    external = var.host_port
  }
  
  restart = "unless-stopped"
  
  # Labels pour identifier le conteneur
  labels {
    label = "managed-by"
    value = "terraform"
  }
  
  labels {
    label = "project"
    value = "demo-devops"
  }
}

# Output: Afficher l'URL du site
output "app_url" {
  description = "URL de l'application"
  value       = "http://localhost:${var.host_port}"
}

output "container_id" {
  description = "ID du conteneur Docker"
  value       = docker_container.app.id
}

output "container_name" {
  description = "Nom du conteneur"
  value       = docker_container.app.name
}