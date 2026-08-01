variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the new VPC."
}

variable "az_count" {
  type        = number
  default     = 2
  description = "Number of availability zones to spread public/private subnets across."
}

variable "container_image" {
  type        = string
  default     = "public.ecr.aws/nginx/nginx:latest"
  description = "Placeholder container image to run in the ECS service."
}

variable "container_port" {
  type        = number
  default     = 80
  description = "Port the container listens on."
}

variable "task_cpu" {
  type        = string
  default     = "256"
  description = "Fargate task CPU units."
}

variable "task_memory" {
  type        = string
  default     = "512"
  description = "Fargate task memory (MiB)."
}

variable "desired_count" {
  type        = number
  default     = 1
  description = "Number of ECS service tasks to run."
}
