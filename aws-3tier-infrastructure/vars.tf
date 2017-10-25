# CIDR blocks for VPC
# ---------------------------------------------------------
variable "vpc_cidr" {}

# CIDR blocks for public and private subnets
# ---------------------------------------------------------
variable "subnet_cidr_blocks" {
  type = "map"
}

variable "count_subnet" {
  default = "3"
}

# TAG VARIABLES
# ---------------------------------------------------------
# Environment type. E.g. Prod, QA, DEV
variable "environment" {}

# Dev project. Should not be configured when running tests!
variable "project" {}
