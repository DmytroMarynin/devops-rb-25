variable "cluster_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "instance_type" {
  default = "t3.small"
}
variable "desired_capacity" {
  default = 1
}
variable "max_capacity" {
  default = 2
}
variable "min_capacity" {
  default = 1
}
