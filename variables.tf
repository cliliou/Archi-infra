variable "resource_group_location" {
  type        = string
  default     = "francecentral"
  description = "Location for all resources."
}

variable "resource_group_locationBis" {
  type        = string
  default     = "westeurope"
  description = "Location for all resources."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random value so name is unique in your Azure subscription."
}

variable "container_group_name_prefix" {
  type        = string
  description = "Prefix of the container group name that's combined with a random value so name is unique in your Azure subscription."
  default     = "cap"
}

variable "container_name_prefix" {
  type        = string
  description = "Prefix of the container name that's combined with a random value so name is unique in your Azure subscription."
  default     = "aci"
}

variable "image" {
  type        = string
  description = "Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials."
  default     = "clementiliou/archi-infra:1.0.1"
}

variable "image-front" {
  type        = string
  description = "container du magnifique front developer par Clément Bruley"
  default     = "clementiliou/archi-infra-front:1.0.7"
}

variable "port" {
  type        = number
  description = "Port to open on the container and the public IP address."
  default     = 3000
}

variable "port-front" {
  type        = number
  description = "Port to open for front"
  default     = 8080
}

variable "cpu_cores" {
  type        = number
  description = "The number of CPU cores to allocate to the container."
  default     = 1
}

variable "memory_in_gb" {
  type        = number
  description = "The amount of memory to allocate to the container in gigabytes."
  default     = 2
}

variable "restart_policy" {
  type        = string
  description = "The behavior of Azure runtime if container has stopped."
  default     = "Always"
  validation {
    condition     = contains(["Always", "Never", "OnFailure"], var.restart_policy)
    error_message = "The restart_policy must be one of the following: Always, Never, OnFailure."
  }
}

#Variables for DB

variable "DB_HOST" {
  type    = string
  default = "postgres-archi"
}

variable "DB_PORT" {
  type    = string
  default = "5432"
}

variable "DB_USER" {
  type    = string
  default = "username"
}

variable "DB_PASSWORD" {
  type    = string
  default = "password"
}

variable "DB_DATABASE" {
  type    = string
  default = "DATABASE"
}

#Ansible and vms

variable "ssh_user" {
  type = string
  default = "adminuser"
}