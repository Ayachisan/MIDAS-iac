variable "suffix" {
  description = "Suffix for resource names (use project-5)"
  type        = string
  nullable = false
  default = "MIDAS-service-m1.xxlarge"
}

variable "key" {
  description = "Name of key pair"
  type        = string
  default     = "id_rsa_chameleon_project_5"
}

variable "nodes" {
  type = map(string)
  default = {
    "node1" = "192.168.1.11"
    "node2" = "192.168.1.12"
    "node3" = "192.168.1.13"
  }
}
