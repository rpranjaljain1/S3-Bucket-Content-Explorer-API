data "aws_ssm_parameter" "ami_id" {
  name = "AMI-id"  
}



module "ec2-instance" {
  source = "./module/ec2-instance"
  ami_id = data.aws_ssm_parameter.ami_id.value
  instance_type = var.instance_type
  iam_role_name = var.iam_role_name
  vpc_id = var.vpc_id
}

module "S3" {
  source = "./module/s3"
  bucket_name = var.bucket_name
}


resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform_lock"  
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}