variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "ap-southeast-2"
}

variable "aws_key_name" {}

variable "aws_private_key_path" {}

variable "network_address_space" {
  default = "10.1.0.0/16"
}

variable "subnet_address_space" {
  default = "10.1.0.0/24"
}
