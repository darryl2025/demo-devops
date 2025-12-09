# Outputs Terraform

output "app_url" {
  description = "URL pour accéder à l'application"
  value       = "http://localhost:${var.host_port}"
}

output "container_id" {
  description = "ID du conteneur Docker créé"
  value       = docker_container.app.id
}

output "container_name" {
  description = "Nom du conteneur"
  value       = docker_container.app.name
}

output "docker_image" {
  description = "Image Docker utilisée"
  value       = var.docker_image
}

output "ports" {
  description = "Mapping des ports"
  value       = "${var.container_port}:${var.host_port}"
}

output "deployment_info" {
  description = "Informations de déploiement"
  value = {
    environment    = var.environment
    container_name = docker_container.app.name
    image          = var.docker_image
    url            = "http://localhost:${var.host_port}"
  }
}