# Host static Website using AWS s3 bucket
This repository contains the Terraform code to host index.html file on puplic cloud using AWS S3 bucket. It includes creating s3 bucket, s3 object and s3 bucket policy.

## Overview
This project uses Terraform to create the following AWS resources:
* AWS S3 bucket
* resource AWS S3 bucket public access block
* AWS S3 bucket website configuration
* AWS bucket policy
* AWS S3 object

## Prerequisites
Before running the deployment script, you will need to have the following:

* AWS account.
* Terraform installed on your local machine.
* AWS CLI installed on your local machine.
* AWS credentials configured on your local machine.

## To get started:
Clone this repository to your local machine.
```
git clone https://github.com/AbdulrahmanElfeki/AWS-LABS
cd LAB5
```
Run ```terraform init``` to download the necessary Terraform plugins.

Run ```terraform plan``` to preview the changes that Terraform plans to make to your infrastructure. 

Run ```terraform apply``` to deploy your infrastructure. 
## verification
![image](https://github.com/user-attachments/assets/6852bf4b-a656-4298-b6f0-eee6c84da598)
![image](https://github.com/user-attachments/assets/3cf96a2a-e990-45e0-a98a-f751b7a3fb34)

