
data "aws_vpc" "lab" {
  id = var.vpc_id
}

data "aws_subnets" "lab" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.lab.id]
  }
}

data "aws_subnet" "lab" {
  for_each = toset(data.aws_subnets.lab.ids)
  id       = each.value
}
