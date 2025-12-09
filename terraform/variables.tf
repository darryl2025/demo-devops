# Variables Terraform pour le projet Demo DevOps

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
  description = "Port exposé sur l'hôte"
  type        = number
  default     = 8080
}

variable "container_name" {
  description = "Nom du conteneur Docker"
  type        = string
  default     = "demo-devops-container"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "development"
  
  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "L'environnement doit être development, staging ou production."
  }
}