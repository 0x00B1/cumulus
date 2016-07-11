resource "aws_db_instance" "primary" {
  allocated_storage = 1000
  apply_immediately = true
  db_subnet_group_name = "${aws_db_subnet_group.primary.id}"
  engine = "mysql"
  instance_class = "db.m4.large"
  password = "pEC2iZK28t2822L8"
  tags {
    Name = "primary"
  }
  username = "imaging"
  vpc_security_group_ids = [
    "${aws_security_group.MySQL.id}"
  ]
}

resource "aws_db_subnet_group" "primary" {
  description = "primary"
  name = "primary"
  subnet_ids = [
    "${aws_subnet.private-us-east-1a.id}",
    "${aws_subnet.private-us-east-1b.id}",
    "${aws_subnet.private-us-east-1d.id}",
    "${aws_subnet.private-us-east-1e.id}"
  ]
  tags {
    Name = "primary"
  }
}
