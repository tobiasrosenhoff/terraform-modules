# Define Elastic IP
# ---------------------------------------------------------
resource "aws_eip" "nat" {
  vpc = true
}
