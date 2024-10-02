# Trigger Lambda Function by S3
This repository contains the Terraform code to triiger Lambda function by s3 bucket and create an entry in DynamoDB table . It includes creating s3 bucket, Lambda function and DynamoDB database.

## Overview
This project uses Terraform to create the following AWS resources:
* Lambda Function.
* S3 bucket (Trigger).
* Amazon SNS (Destination 1).
* DynamoDB table (Destination 2).
* IAM role for Lambda Function with required permissions.

## Prerequisites
Before running the deployment script, you will need to have the following:
* AWS account.
* SNS Topic subscribtion.
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
upload an object to S3 bucket and check both DynamoDB table & email Inbox.
