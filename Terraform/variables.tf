variable "ami_id" {
  description = "The AMI ID to launch the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "iam_role_name" {
  description = "The name of the IAM role to associate with the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EC2 instance and security group will be created"
  type        = string
}
