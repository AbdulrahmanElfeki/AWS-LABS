# Create AWS user with Administative privileges
This repository contains the Terraform code to create AWS IAM user. It includes creating AWS Group, attaching AWS managed policy (**AdministratorAccess**) & adding IAM user to the Group.

## Overview
This project uses Terraform to create the following AWS resources:

* AWS IAM group
* AWS IAM User
* AWS IAM Access Key

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
cd LAB1
```
Run ```terraform init``` to download the necessary Terraform plugins.

Run ```terraform plan``` to preview the changes that Terraform plans to make to your infrastructure. 

Run ```terraform apply``` to deploy your infrastructure. 

## Verification
![image](https://github.com/user-attachments/assets/38fa1211-8976-4298-b0d1-00e971ee160c)
