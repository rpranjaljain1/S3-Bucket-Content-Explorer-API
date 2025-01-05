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


![image](https://github.com/user-attachments/assets/c1f9eee6-2a8f-4ab7-b793-aab30f93c53f)
EC2 instance created using terraform on which python code is running



![image](https://github.com/user-attachments/assets/01d57b98-01ba-4ee4-b370-d436b2240dc0)
AWS s3 bucket created using terraform having 2 directories dir1 (empty) and dir2 (containing two files)


![image](https://github.com/user-attachments/assets/5dce5377-b28b-413a-91c0-8d1870eeed16)
Contents for dir2



![image](https://github.com/user-attachments/assets/e8eb40c9-d8ac-4f5d-86da-5a08c6786821)
Result of https://54.158.30.21:5000/list-bucket-content/



![image](https://github.com/user-attachments/assets/d3dffea5-5a3c-4888-a899-e561e197b826)
https://54.158.30.21:5000/list-bucket-content/dir1



![image](https://github.com/user-attachments/assets/17c5fc07-9194-472e-b56b-9134c34e74a9)
https://54.158.30.21:5000/list-bucket-content/dir2



![image](https://github.com/user-attachments/assets/337106f8-c1b1-40b2-b16a-c94937e39eb6)
Handling error for non-existing paths like https://54.158.30.21:5000/list-bucket-content/directory-unknown



![image](https://github.com/user-attachments/assets/851650ca-4584-4357-93f2-eea9ac224ff5)
Added self signed certificate to deploy the service on HTTPS





