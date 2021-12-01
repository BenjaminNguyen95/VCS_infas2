#####Variable#######
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "key_name" {}
variable "region" {
  default = "ap-southeast-1"
}
variable "private_key_path" {}
variable "network_address_space" {
  description = "network_address_space"
  default     = "192.168.0.0/16"
}
variable "s3_bucket" {}
variable "billing_code_tag" {}
variable "environtment_tag" {}
variable "instance_count" {
  description = "Number of instance count will deploy"
  type        = number
  default     = 3
}
variable "subnet_count" {
  description = "Number of subnet will be create"
  default     = 3
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  type = list(any)
}

variable "public_subnets" {
  type = list(any)
}

#variable "intance_count_2" {
#  default = len(data.aws_availability_zones.azn.names)
#}
#
#variable "subnet_count_2" {
#  default = len(data.aws_availability_zones.azn.names)
#}