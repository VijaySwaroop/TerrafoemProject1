variable "vpc_name" {}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "tenancy" {}

variable "cidr_subnet" {}
variable "vpc_id" {}
variable "subnet_name" {}
variable "IGW_Name" {}
variable "gw_cidr" {}
variable "route_name" {}
variable "public_ip" {}