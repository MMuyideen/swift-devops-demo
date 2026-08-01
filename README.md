# AWS ECS (Fargate) via Terraform

Deploys a placeholder ECS Fargate service into a new VPC: VPC with public and
private subnets across 2 AZs, internet gateway, NAT gateway, an Application
Load Balancer in the public subnets, and an ECS cluster/task
definition/service running a placeholder container (`nginx` by default) in
the private subnets.

Swap `container_image` (and `container_port` / `task_cpu` / `task_memory`) in
`terraform.tfvars` for your real application once you're ready.

## Prerequisites

1. AWS CLI installed and credentials configured (`aws configure` or an
   assumed role with permissions for VPC, ECS, ELB, IAM, and CloudWatch Logs).
2. Terraform >= 1.5

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## After apply

```bash
terraform output alb_url
```

Open the URL in a browser — traffic flows ALB -> target group -> ECS
Fargate tasks in the private subnets (reachable through the NAT gateway for
outbound image pulls).

## Notes

- This creates a **new** VPC; it does not reuse existing networking.
- The ECS service has no autoscaling configured — `desired_count` is fixed.
- `terraform.tfstate` will contain resource ARNs and IDs. Use a remote
  backend (e.g. S3 + DynamoDB locking) rather than local state for anything
  beyond a quick test.
