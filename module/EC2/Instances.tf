resource "aws_instances" "Instances" {
    count = "${vars.ec2count}"
    ami = "${vars.ami_no}"
    instance_type = "${vars.instancetype}"
    subnet_id = "${vars.subnet_id}"
    tags{
        Name = "${vars.instance_name}"
    }
}





