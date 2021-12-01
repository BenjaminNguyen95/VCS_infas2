module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  version                      = "~> 2.0"
  name                         = "global-primary-co"
  cidr                         = var.network_address_space
  azs                          = slice(data.aws_availability_zones.azn.names, 0, var.subnet_count)
  public_subnets               = data.template_file.public_cidrsubnet[*].rendered
  private_subnets              = data.template_file.privates_cidrsubnet[*].rendered
  enable_nat_gateway           = false
  create_database_subnet_group = false
  tags = {
    Evirontment = "Dev"
    Team        = "Network"
  }
}