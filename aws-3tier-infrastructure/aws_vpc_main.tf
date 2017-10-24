# Create stage VPC in current region
# ---------------------------------------------------------
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.environment}-${var.project}-vpc"
    Environment = "${var.environment}"
    Project = "${var.project}"
  }
}
