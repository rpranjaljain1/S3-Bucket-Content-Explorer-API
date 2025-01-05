terraform {
  backend "s3" {
    bucket         = "api-calls-1234"  
    key            = "api/terraform.tfstate"  
    region         = "us-east-1"  
    encrypt        = true
    dynamodb_table = "terraform-lock" 
  }
}