# Define Internet Gateway
# ---------------------------------------------------------
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.environment}-${var.project}-igw"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Define NAT Gateways for all private subnets
# ---------------------------------------------------------
resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${element(aws_subnet.public-subnet.*.id,count.index)}"
}
