variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "The CIDR blocks that are allowed to access the EC2 instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]  
}
