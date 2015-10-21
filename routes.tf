/*
  Public Routes
*/
resource "aws_route_table" "public1" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "${var.default_route_cidr}"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "public1" {
    subnet_id = "${aws_subnet.public-subnet1.id}"
    route_table_id = "${aws_route_table.public1.id}"
}


/*
  Private Routes
*/
resource "aws_route_table" "private1" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "${var.default_route_cidr}"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "private1" {
    subnet_id = "${aws_subnet.private-subnet1.id}"
    route_table_id = "${aws_route_table.private1.id}"
}