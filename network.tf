resource "aws_vpc" "imaging" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "imaging"
  }
}

resource "aws_eip" "gateway" {
  vpc = true
}

resource "aws_internet_gateway" "primary" {
  tags {
    Name = "primary"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_nat_gateway" "primary" {
  allocation_id = "${aws_eip.gateway.id}"
  depends_on = [
    "aws_internet_gateway.primary"
  ]
  subnet_id = "${aws_subnet.public-us-east-1a.id}"
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

resource "aws_subnet" "public-us-east-1d" {
  availability_zone = "us-east-1d"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1d"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "public-us-east-1e" {
  availability_zone = "us-east-1e"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "imaging-public-us-east-1e"
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

resource "aws_subnet" "private-us-east-1d" {
  availability_zone = "us-east-1d"
  cidr_block = "10.0.7.0/24"
  tags {
    Name = "imaging-private-us-east-1d"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_subnet" "private-us-east-1e" {
  availability_zone = "us-east-1e"
  cidr_block = "10.0.8.0/24"
  tags {
    Name = "imaging-private-us-east-1e"
  }
  vpc_id = "${aws_vpc.imaging.id}"
}
