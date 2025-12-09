output "container_id" {
  description = "ID du conteneur Docker"
  value       = docker_container.app.id
}

output "container_name" {
  description = "Nom du conteneur Docker"
  value       = docker_container.app.name
}

output "image_id" {
  description = "ID de l'image Docker"
  value       = docker_image.app.image_id
}