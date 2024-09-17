# Simple Bastion Host
This repository contains the Terraform code to deploy infrastructure on AWS. It includes creating a VPC with public and private subnets, launching EC2 instances in the public and private subnets.

# AWS Arhitecture
![image](https://github.com/user-attachments/assets/70cad716-f954-4b64-813d-7cf098cff58a)


## Overview
This project uses Terraform to create the following AWS resources:

* VPC
* Internet Gateway.
* NAT Gateway
* Public EC2 instance.
* Private EC2 instance.
* Elastic IP address
* security groups
* private route tables
* public route tables
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
cd LAB3
```
Run ```terraform init``` to download the necessary Terraform plugins.

Run ```terraform plan``` to preview the changes that Terraform plans to make to your infrastructure. 

Run ```terraform apply``` to deploy your infrastructure. 

## verification
![image](https://github.com/user-attachments/assets/5e6de229-f7ec-4771-b036-14b226ffae08)
