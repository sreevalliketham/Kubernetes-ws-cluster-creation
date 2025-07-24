variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

<<<<<<< HEAD
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
=======
variable "access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
>>>>>>> 229109b0d10580a8c30806e2cb269f205fec546f
}
