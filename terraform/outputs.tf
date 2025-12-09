output "app_url" {
  value = "http://localhost:${var.host_port}"
}

output "container_id" {
  value = docker_container.app.id
}

output "container_name" {
  value = docker_container.app.name
}
