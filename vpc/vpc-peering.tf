resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0
  # peer_owner_id = var.peer_owner_id   - if is is a cross-account
  vpc_id        = aws_vpc.main.id        # Requestor VPC
  peer_vpc_id   = data.aws_vpc.default.id         # Acceptor VPC
  auto_accept = true

  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 :0
  route_table_id = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "default-vpc-peering" {
  count = var.is_peering_required ? 1 :0
  route_table_id = data.aws_route_table.main.route_table_id
  destination_cidr_block = var.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}