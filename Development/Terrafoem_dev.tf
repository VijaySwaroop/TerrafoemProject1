module "VPC" {
  source = "../module/VPC"
  vpc_name = "My_Vpc"
  vpc_cidr = "192.16.0.0/16"
  tenancy = "default"
  cidr_subnet = "192.16.1.0/24"
  vpc_id = "${module.VPC.vpc_id}" 
  subnet_name = "My_Subnet"
  IGW_Name = "Internet_gateway"
  gw_cidr = "0.0.0.0/0"
  route_name = "module_route"
  public_ip = "true"
}

module "Security_group" {
  source = "../module/Security_group"
  description = "Allow all"
  vpc_id = "${module.VPC.vpc_id}"
}

module "EC2" {
  source = "../module/EC2"
  instance_name = "New_instance"
  ec2count = "1"
  ami_no = "ami-0912f71e06545ad88"
  instance_type = "t2.micro"
  subnet_id = "${module.VPC.subnet_id}"
  sgid = "${module.Security_group.sg_id}"
}