# Neo4j Kubernetes Lab on AWS

Terraform project for building a Neo4j Kubernetes lab on AWS EKS.

## Architecture

- AWS region: us-east-1
- Existing VPC: neo4j-eks-lab
- VPC CIDR: 10.20.0.0/16
- Six subnets across three Availability Zones
- Terraform executed from AWS CloudShell
- Neo4j deployment planned through Helm

## Terraform workflow

1. Review Terraform configuration.
2. Initialize Terraform.
3. Validate the configuration.
4. Review the execution plan.
5. Apply only after reviewing infrastructure changes and costs.

## Important

Terraform state must be stored safely before managing
billable AWS resources. Never commit Terraform state,
credentials, or secret variable files to GitHub.
