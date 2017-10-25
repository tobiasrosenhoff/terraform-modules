# Get the list of available zones in the current region
# ---------------------------------------------------------
data "aws_availability_zones" "all" {}

# Create subnets in different availability zones
# ---------------------------------------------------------
resource "aws_subnet" "public-subnet" {
  count = "${var.count_subnet}"
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${lookup(var.subnet_cidr_blocks, format("public_zone%d", count.index))}"
  availability_zone = "${element(data.aws_availability_zones.all.names, count.index)}"

  tags {
    Name = "${var.environment}-${var.project}-${element(data.aws_availability_zones.all.names, count.index)}-pub"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}

# Create subnets in different availability zones
# ---------------------------------------------------------
resource "aws_subnet" "private-subnet" {
  count = "${var.count_subnet}"
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${lookup(var.subnet_cidr_blocks, format("private_zone%d", count.index))}"
  availability_zone = "${element(data.aws_availability_zones.all.names, count.index)}"

  tags {
    Name = "${var.environment}-${var.project}-${element(data.aws_availability_zones.all.names, count.index)}-priv"
    Environment = "${var.environment}"
  }
}
