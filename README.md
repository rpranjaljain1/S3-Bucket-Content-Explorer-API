# S3-Bucket-Content-Explorer-API

This project implements an HTTPS service using Python to interact with AWS S3. The service exposes an endpoint:

GET http://<IP>:<PORT>/list-bucket-content/<path>

Features:


Retrieve S3 Bucket Content: Returns the content of a specified path within an S3 bucket. If no path is specified, the top-level content is returned.
Flexible Deployment: Terraform scripts are provided to automate the creation of required AWS resources, including the S3 bucket and the EC2 instance hosting the service.


Components:
Python Code: Implements the HTTP service using frameworks like Flask or FastAPI. It uses the AWS SDK for Python (boto3) to interact with S3.
Terraform Configuration: Manages the infrastructure as code to provision AWS resources, ensuring consistent and reproducible deployments.
This solution combines Python's efficiency for API development with Terraform's infrastructure automation, providing a scalable and maintainable approach to building and deploying cloud-native services.
