
# Allocate a public IPv4 address for the NAT Gateway.
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name    = "${var.cluster_name}-nat-eip"
    Project = "neo4j-kubernetes-lab"
  }
}

# Place the NAT Gateway in an existing public subnet.
resource "aws_nat_gateway" "lab" {
  allocation_id = aws_eip.nat.id
  subnet_id     = "subnet-07b6953afb68e8be7"

  tags = {
    Name    = "${var.cluster_name}-nat"
    Project = "neo4j-kubernetes-lab"
  }

  depends_on = [
    aws_eip.nat
  ]
}

# Route outbound traffic from the existing private subnets
# through the NAT Gateway.
resource "aws_route" "private_nat" {
  route_table_id         = "rtb-0b8a0561f60b0decf"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.lab.id
}
