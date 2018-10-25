module "VPC" {
  source = "../module/VPC"
  vpc_name = "My_Vpc"
  vpc_cidr = "192.16.0.0/16"
  tenancy = "default"
  cidr_subnet = "192.16.1.0/24"
  vpc_id = "${module.VPC.vpc_id}" 
  subnet_name = "My_Subnet"
}
module "EC2" {
  source = "../module/EC2"
  ec2count = "1"
  ami_no = "AMi_no"
  instance_type = "t2.micro"
  subnet_id = "${module.VPC.subnet_id}"
}