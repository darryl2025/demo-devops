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
