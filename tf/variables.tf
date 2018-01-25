variable "prefix" {
  description = "Prefix for all AWS resources for this project."
  default     = "c2hw"
}

variable "ssh_key_name" {
  description = "Name of the Key Pair to be used for SSH access to EC2 instances."
  default     = "mark-laptop"
}
