provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "aws-vpc-scenario2"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}


/*
  NAT Instance
*/

resource "aws_instance" "nat" {
    ami = "${lookup(var.nat_ami, var.aws_region)}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key_name}"
    security_groups = ["${aws_security_group.nat.id}"]
    subnet_id = "${aws_subnet.public-subnet1.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }
}

/*
  Elastic IP for NAT Instance
*/
resource "aws_eip" "nat" {
    instance = "${aws_instance.nat.id}"
    vpc = true
}


/*
  Web Server
*/

resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.aws_availability_zone}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key_name}"
    security_groups = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.public-subnet1.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Web Server 1"
    }
}

/*
  Elastic IP for NAT Instance
*/
resource "aws_eip" "web-1" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}


/*
  Database Server
*/

resource "aws_instance" "db-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.aws_availability_zone}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key_name}"
    security_groups = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.private-subnet1.id}"

    tags {
        Name = "DB Server 1"
    }
}