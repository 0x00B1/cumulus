resource "aws_vpc" "imaging" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "imaging"
  }
}

resource "aws_internet_gateway" "primary" {
  tags {
    Name = "primary"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_route" "gateway" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.primary.id}"
  route_table_id = "${aws_vpc.imaging.main_route_table_id}"
}

resource "aws_subnet" "public-us-east-1a" {
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1a"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "public-us-east-1b" {
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1b"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "public-us-east-1c" {
  availability_zone = "us-east-1c"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1c"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "public-us-east-1d" {
  availability_zone = "us-east-1d"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1d"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "private-us-east-1a" {
  availability_zone = "us-east-1a"
  cidr_block = "10.0.5.0/24"
  tags {
    Name = "imaging-private-us-east-1a"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "private-us-east-1b" {
  availability_zone = "us-east-1b"
  cidr_block = "10.0.6.0/24"
  tags {
    Name = "imaging-private-us-east-1b"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "private-us-east-1c" {
  availability_zone = "us-east-1c"
  cidr_block = "10.0.7.0/24"
  tags {
    Name = "imaging-private-us-east-1c"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "private-us-east-1d" {
  availability_zone = "us-east-1d"
  cidr_block = "10.0.8.0/24"
  tags {
    Name = "imaging-private-us-east-1d"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_route_table_association" "public-us-east-1a" {
  route_table_id = "${aws_vpc.imaging.main_route_table_id}"
  subnet_id = "${aws_subnet.public-us-east-1a.id}"
}

resource "aws_route_table_association" "public-us-east-1b" {
  route_table_id = "${aws_vpc.imaging.main_route_table_id}"
  subnet_id = "${aws_subnet.public-us-east-1b.id}"
}
