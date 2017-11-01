output "pub_subnet_id" {
  value = ["${aws_subnet.public-subnet.*.id}"]
}

output "priv_subnet_id" {
  value = ["${aws_subnet.private-subnet.*.id}"]
}

output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "aws_route_table_id" {
  value = "${aws_route_table.private.id}"
}

output "aws_route_table_id_default" {
  value = "${aws_route.default.id}"
}

output "aws_vpc_cidr" {
  value = "${aws_vpc.default.cidr_block}"
}

output "aws_nat_gateway_id" {
  value = "${aws_nat_gateway.default.id}"
}

output "aws_internet_gateway_id" {
  value = "${aws_internet_gateway.default.id}"
}
