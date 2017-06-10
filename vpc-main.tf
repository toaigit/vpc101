terraform {
  required_version = ">= 0.9"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "vpcDUMMY" {
  cidr_block = "10.2.0.0/16"
  enable_dns_hostnames = true
  tags {
     Name = "vpcDUMMY"
     }
}

resource "aws_internet_gateway" "igwDUMMY" {
    vpc_id = "${aws_vpc.vpcDUMMY.id}"
}

resource "aws_route_table" "rtblDUMMY" {
    vpc_id = "${aws_vpc.vpcDUMMY.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igwDUMMY.id}"
    }

    tags {
        Name = "RouteTableDUMMY"
    }
}

resource "aws_route_table_association" "vpcDUMMYrbtl" {
    subnet_id = "${aws_subnet.SNZonea.id}"
    route_table_id = "${aws_route_table.rtblDUMMY.id}"
}

resource "aws_route_table_association" "vpcDUMMYrbtlb" {
    subnet_id = "${aws_subnet.SNZoneb.id}"
    route_table_id = "${aws_route_table.rtblDUMMY.id}"
}

resource "aws_route_table_association" "vpcDUMMYrbtlc" {
    subnet_id = "${aws_subnet.SNZonec.id}"
    route_table_id = "${aws_route_table.rtblDUMMY.id}"
}

resource "aws_subnet" "SNZonea" {
  vpc_id     = "${aws_vpc.vpcDUMMY.id}"
  availability_zone = "us-west-2a"
  cidr_block = "10.2.0.0/20"
    tags {
        Name = "vpcDUMMY_Zonea"
    }
}

resource "aws_subnet" "SNZoneb" {
  vpc_id     = "${aws_vpc.vpcDUMMY.id}"
  availability_zone = "us-west-2b"
  cidr_block = "10.2.48.0/20"
    tags {
        Name = "vpcDUMMY_Zoneb"
    }
}
resource "aws_subnet" "SNZonec" {
  vpc_id     = "${aws_vpc.vpcDUMMY.id}"
  availability_zone = "us-west-2c"
  cidr_block = "10.2.96.0/20"
    tags {
        Name = "vpcDUMMY_Zonec"
    }
}

