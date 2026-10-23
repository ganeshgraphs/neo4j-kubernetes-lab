
output "vpc_id" {
  description = "Existing VPC ID"
  value       = data.aws_vpc.lab.id
}

output "vpc_cidr" {
  description = "Existing VPC CIDR"
  value       = data.aws_vpc.lab.cidr_block
}

output "subnets" {
  description = "Existing subnets and their availability zones"
  value = {
    for id, subnet in data.aws_subnet.lab : id => {
      cidr_block        = subnet.cidr_block
      availability_zone = subnet.availability_zone
      tags              = subnet.tags
    }
  }
}
