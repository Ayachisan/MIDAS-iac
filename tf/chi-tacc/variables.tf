variable "suffix" {
  description = "Suffix for resource names"
  type        = string
  default     = "MIDAS-service-GPU"
}

variable "key" {
  description = "Name of key pair uploaded to Chameleon"
  type        = string
  default     = "id_rsa_chameleon_project_5"  # Must match Chameleon dashboard
}

variable "nodes" {
  type = map(string)
  default = {
    node1 = "192.168.1.11"  # This can still be used for naming and tagging
  }
}

variable "reservation_id" {
  description = "Reservation ID from your CHI@TACC lease"
  type        = string
  default     = "24a7ddbb-5330-4554-ba3f-f5a7f704ccb7"
}
