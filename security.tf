resource "aws_security_group" "MySQL" {
  description = "MySQL"
  egress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
  }
  name = "MySQL"
  vpc_id = "${aws_vpc.imaging.id}"
}

resource "aws_security_group" "SSH" {
  description = "SSH"
  egress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    protocol = "SSH"
    to_port = 22
  }
  name = "SSH"
  vpc_id = "${aws_vpc.imaging.id}"
}
