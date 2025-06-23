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
  description = "Your public IP address CIDR for SSH and kubectl access."
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet in AZ-a."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr2" {
  description = "CIDR block for Public Subnet in AZ-c."
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_app_subnet_cidr" {
  description = "CIDR block for Private App Subnet in AZ-a."
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_app_subnet_cidr2" {
  description = "CIDR block for Private App Subnet in AZ-c."
  type        = string
  default     = "10.0.6.0/24"
}

variable "private_db_subnet_cidr" {
  description = "CIDR block for Private DB Subnet in AZ-a."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_db_subnet_cidr2" {
  description = "CIDR block for Private DB Subnet in AZ-c."
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
  description = "The DB instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Storage (in GB) to allocate to the DB instance."
  type        = number
  default     = 20
}

variable "ssh_key_pair_name" {
  description = "The EC2 Key Pair Name for SSH access."
  type        = string
  default     = "mykey"
}
