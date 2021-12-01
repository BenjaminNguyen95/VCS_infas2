data "aws_availability_zones" "azn" {}

data "aws_ami" "aws-linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "public_cidrsubnet" {
  count    = var.subnet_count
  template = "$${cidrsubnet(vpc_cidr,8,count)}"
  vars = {
    vpc_cidr = var.network_address_space
    count    = count.index
  }
}

data "template_file" "privates_cidrsubnet" {
  count    = var.subnet_count
  template = "$${cidrsubnet(vpc_cidr,8,count)}"
  vars = {
    vpc_cidr = var.network_address_space
    count    = count.index + 10
  }
}
