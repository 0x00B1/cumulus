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
