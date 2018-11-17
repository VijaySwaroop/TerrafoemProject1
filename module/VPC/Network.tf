resource "aws_vpc" "Main" {
cidr_block = "${var.vpc_cidr}"
instance_tenancy = "${var.tenancy}"
tags{
    Name = "${var.vpc_name}"
}  
}
resource "aws_internet_gateway" "IGW" {
    vpc_id = "${aws_vpc.Main.id}"
    tags{
        Name = "${var.IGW_Name}"
    }
}
resource "aws_subnet" "Main_subnet" {
    cidr_block = "${var.cidr_subnet}"
    map_public_ip_on_launch = "${var.public_ip}"
    vpc_id = "${var.vpc_id}"
    tags{
        Name = "${var.subnet_name}"
    }
}
resource "aws_route_table" "route" {
  vpc_id     = "${aws_vpc.Main.id}"
#  depends_on = "${aws_subnet.Subnet_1.id1}"
  route {
    cidr_block = "${var.gw_cidr}"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }
  tags {
    Name = "${var.route_name}"
  }
}
resource "aws_route_table_association" "subnet_router_association" {
  subnet_id      = "${aws_subnet.Main_subnet.id}"
  route_table_id = "${aws_route_table.route.id}"
}
output "vpc_id" {
  value = "${aws_vpc.Main.id}"
}
output "subnet_id" {
  value = "${aws_subnet.Main_subnet.id}"
}