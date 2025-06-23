# variables.tf

# --- Variables (corresponding to CloudFormation Parameters) ---
variable "environment_name" {
  description = "A name prefix for resources to ensure uniqueness."
  type        = string
  default     = "ExpenseTracker"
}

variable "project_tag" {
  description = "A tag value for all resources."
  type        = string
  default     = "Capstone"
}

variable "admin_ip_cidr" {
  description = "Your public IP address CIDR for SSH (to EC2) and kubectl access (to EKS API). IMPORTANT: CHANGE TO YOUR PUBLIC IP CIDR (e.g., 203.0.113.0/32) for kubectl access!"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the Public Subnet (Frontend ALB and NAT Gateway) in AZ-a."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr2" {
  description = "CIDR block for the Public Subnet (Frontend ALB and NAT Gateway) in AZ-c."
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_app_subnet_cidr" {
  description = "CIDR block for the Private Application Subnet (EKS Worker Nodes/App Pods) in AZ-a."
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_app_subnet_cidr2" {
  description = "CIDR block for the Private Application Subnet (EKS Worker Nodes/App Pods) in AZ-c."
  type        = string
  default     = "10.0.6.0/24"
}

variable "private_db_subnet_cidr" {
  description = "CIDR block for the Private Database Subnet (RDS MySQL) in AZ-a."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_db_subnet_cidr2" {
  description = "CIDR block for the Private Database Subnet (RDS MySQL) in AZ-c."
  type        = string
  default     = "10.0.4.0/24"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "expense-tracker-eks-cluster"
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for EKS worker nodes."
  type        = string
  default     = "t3.medium"
}

variable "eks_node_min_size" {
  description = "Minimum number of EKS worker nodes."
  type        = number
  default     = 1
}

variable "eks_node_desired_size" {
  description = "Desired number of EKS worker nodes."
  type        = number
  default     = 2
}

variable "eks_node_max_size" {
  description = "Maximum number of EKS worker nodes."
  type        = number
  default     = 3
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS DB instance."
  type        = string
  default     = "expense-tracker-db"
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "expensetracker"
}

variable "db_instance_class" {
  description = "The DB instance class (e.g., db.t3.micro)."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The amount of storage (GB) to allocate to the DB instance."
  type        = number
  default     = 20
}

variable "ssh_key_pair_name" {
  description = "The EC2 Key Pair Name for SSH access to EKS worker nodes."
  type        = string
  default     = "mykey"
}

# main.tf

provider "aws" {}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  availability_zone  = data.aws_availability_zones.available.names[0]
  availability_zone2 = data.aws_availability_zones.available.names[1]
}

# All other resources remain the same, but replace:
# var.availability_zone     -> local.availability_zone
# var.availability_zone2    -> local.availability_zone2

# Example:
# availability_zone = var.availability_zone
# Change to:
# availability_zone = local.availability_zone

# Repeat this wherever AZs are used in your main.tf.

# Keep the rest of your main.tf structure and content unchanged, except for replacing those two variable usages with local values.
