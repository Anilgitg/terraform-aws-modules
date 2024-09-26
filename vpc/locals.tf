# local block for mandatory project name, environment, query for 2 available zones
locals {
  resource_name = "${var.project_name}-${var.environment}"
  az_names      = slice(data.aws_availability_zones.available.names, 0, 2)
}