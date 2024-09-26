variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
  #default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = true
}

# optional
variable "common_tags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}

variable "igw_tags" {
  default = {}
}

variable "public_subnet_cidrs" {
  type = list(any)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "You must provide 2 valid public subnet CIDR"
  }
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnet_cidrs" {
  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "You must provide 2 valid private subnet CIDR"
  }
}

variable "private_subnet_tags" {
  default = {}
}

variable "database_subnet_cidrs" {
  validation {
    condition     = length(var.database_subnet_cidrs) == 2
    error_message = "You must provide 2 valid database subnet cidrs"
  }
}

variable "database_subnet_tags" {
  default = {}
}

variable "db_subnet_group_tags" {
  default = {}
}

variable "nat_gateway_tags" {
  default = {}
}

variable "eip_tags" {
  default = {}
}