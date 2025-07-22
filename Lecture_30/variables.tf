variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2)"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "SSH key name in AWS"
}

variable "name_prefix" {
  default = "devops"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  default     = "lecture30-vpc"
}
