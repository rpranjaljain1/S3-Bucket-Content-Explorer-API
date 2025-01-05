module "security_group" {
  source             = "./security_group"
  security_group_name = "my-ec2-security-group"
  vpc_id             = var.vpc_id
}


resource "aws_instance" "test-instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [module.security_group.security_group_id]   # Associating security group
  iam_instance_profile = var.iam_role_name

  tags = {
    Name = "My EC2 Instance"
  }


  user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install -y python3 python3-pip
                sudo pip3 install --upgrade pip
                sudo pip3 install flask boto3 requests
                python3 --version
                pip3 --version
                python3 -c "import flask, boto3, requests; print('Modules installed successfully!')"
                echo "Python3 and modules installed successfully" > /var/log/user_data_script.log
                EOF
}
