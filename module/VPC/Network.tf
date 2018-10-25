resource "aws_vpc" "Main" {
cidr_block = "${vars.vpc_cidr}"
instance_tenancy = "${vars.tenancy}"
tags{
    Name = "${vars.vpc_name}"
}  
}
resource "aws_subnet" "Main_subnet" {
    cidr_block = "${vars.cidr_subnet}"
    vpc_id = "${vars.vpc_id}"
    tags{
        Name = "${vars.subnet_name}"
    }
}
output "vpc_id" {
  value = "${aws_vpc.Main.id}"
}
output "subnet_id" {
  value = "${aws_subnet.Main_subnet.id}"
}