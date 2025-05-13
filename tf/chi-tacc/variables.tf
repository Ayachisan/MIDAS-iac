variable "suffix" {
  description = "Suffix for resource names"
  type        = string
  default     = "MIDAS-service-GPU"
}

variable "key" {
  description = "SSH key pair name registered on Chameleon"
  type        = string
  default     = "id_rsa_chameleon_project_5"
}

variable "reservation_id" {
  description = "Blazar reservation ID for CHI@TACC"
  type        = string
  default     = "24a7ddbb-5330-4554-ba3f-f5a7f704ccb7"
}