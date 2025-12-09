variable "docker_image" {
  description = "Image Docker à déployer"
  type        = string
  default     = "ghcr.io/darryl2025/demo-devops:latest"
}

variable "container_port" {
  description = "Port interne du conteneur"
  type        = number
  default     = 80
}

variable "host_port" {
  description = "Port exposé sur la machine hôte"
  type        = number
  default     = 8080
}
