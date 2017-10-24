# aws-3tier-infrastructure
Terraform module to create a base VPC network

## Usage

**main.tf**

```
module "aws-3tier-infrastructure" {
  source = "git::git@github.com:StenaIT/ops-infrastructure-modules.git//aws-3tier-infrastructure?ref=v1.0.1"

  count_subnet = "3"

  # Tags
  prefix = "${var.prefix}"
  environment = "${var.environment}"
  type = "${var.type}"
  project = "${var.project}"

}
```

**variables.tf**
```
variable "cidr_blocks" {
  default = {
    public_zone0 = "10.128.1.0/24"
    public_zone1 = "10.128.2.0/24"
    public_zone2 = "10.128.3.0/24"

    private_zone0 = "10.128.5.0/24"
    private_zone1 = "10.128.6.0/24"
    private_zone2 = "10.128.7.0/24"

  }
}
```
