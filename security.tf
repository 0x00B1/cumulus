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
