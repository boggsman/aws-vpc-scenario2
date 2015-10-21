/*
  Public Subnet
*/
resource "aws_subnet" "public-subnet1" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr}"
    tags {
        Name = "Public Subnet"
    }
}


/*
  Private Subnet
*/
resource "aws_subnet" "private-subnet1" {
    vpc_id = "${aws_vpc.default.id}"
    
    cidr_block = "${var.private_subnet_cidr}"
    tags {
        Name = "Private Subnet"
    }
}