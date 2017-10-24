# Connect main route table to Internet Gateway
# ---------------------------------------------------------
resource "aws_route" "default" {
  route_table_id = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}

# Associate main routing table to public subnet
# ---------------------------------------------------------
resource "aws_route_table_association" "public" {
  count = "${var.count_subnet}"
  subnet_id = "${element(aws_subnet.public-subnet.*.id,count.index)}"
  route_table_id = "${aws_vpc.default.main_route_table_id}"
}

# Routing table for private subnet
# ---------------------------------------------------------
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.default.id}"
  }

  tags {
  Name =  "${var.environment}-${var.project}-rtb-priv"
  }
}

# Associate the routing table to all private subnets
# ---------------------------------------------------------
  resource "aws_route_table_association" "private" {
    count = "${var.count_subnet}"
    subnet_id = "${element(aws_subnet.private-subnet.*.id,count.index)}"
    route_table_id = "${aws_route_table.private.id}"
  }
