resource "aws_instance" "Instances" {
    count = "${var.ec2count}"
    ami = "${var.ami_no}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = ["${var.sgid}"]
    tags{
        Name = "${var.instance_name}"
    }
}






