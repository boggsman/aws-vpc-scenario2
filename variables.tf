variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "VPC Region"
    default = "us-east-1"
}

variable "aws_availability_zone" {
    description = "VPC Availability Zone"
    default = "us-east-1a"
}

variable "nat_ami" {
    description = "NAT AMI by region"
    default = {
        us-east-1 = "ami-224dc94a" # this is a special AMI preconfigured to do NAT
    }
}

variable "amis" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-5e8b5936" # ubuntu 14.04 LTS
    }
}

variable "default_route_cidr" {
    description = "default route CIDR"
    default = "0.0.0.0/0"
}

variable "vpc_cidr" {
    description = "CIDR for the entire VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}
