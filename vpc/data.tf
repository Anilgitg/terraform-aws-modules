# querying "available" zones from AWS
data "aws_availability_zones" "available" {
  state = "available"
}

# querying the default VPC in AWS
data "aws_vpc" "default" {
  default = true
}

# querying the MAIN route table in AWS
data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}