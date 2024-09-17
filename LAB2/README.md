# Simple Bastion Host
This repository contains the Terraform code to deploy infrastructure on AWS. It includes creating a VPC with public and private subnets, launching EC2 instances in the public and private subnets.

# AWS Arhitecture
![image](https://github.com/user-attachments/assets/21216efc-7756-4150-8d34-980bbf4ee39f)

## Overview
This project uses Terraform to create the following AWS resources:

* VPC
* Internet Gateway.
* Public EC2 instance.
* Private EC2 instance.
* security groups
* 
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
cd LAB2
```
Run ```terraform init``` to download the necessary Terraform plugins.

Run ```terraform plan``` to preview the changes that Terraform plans to make to your infrastructure. 

Run ```terraform apply``` to deploy your infrastructure. 

## verification
![image](https://github.com/user-attachments/assets/c25f5d32-a603-490f-9fda-7057cd5651cd)

