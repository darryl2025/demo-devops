variable "docker_image" {
  description = "Nom de l'image Docker"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Port interne du conteneur"
  type        = number
  default     = 80
}

variable "host_port" {
  description = "Port externe sur l'hôte"
  type        = number
  default     = 8080
}