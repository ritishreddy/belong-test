variable "aws_region" {
  default = "ap-southeast-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "ubuntuami" {
  default = "ami-0310483fb2b488153"  # Replace with the desired Ubuntu AMI ID
}

variable "redhatami" {
  default = "ami-0310483fb2b488153"  # Replace with the desired Red Hat AMI ID
}

variable "key_name" {
  default = "ansible"  # Replace with your SSH key pair name
}
