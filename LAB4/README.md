# AWS infra in 2 Availability zones with NLB & ALB
This repository contains the Terraform code to deploy infrastructure on AWS. It includes creating a VPC with public and private subnets,internet gateways, NAT gateways, launching EC2 instances in the public and private subnets with apache installed in all EC2 subnets.

# AWS Arhitecture
![image](https://github.com/user-attachments/assets/456914bc-e0af-47a2-86a4-a2fdf66f6b90)


## Overview
This project uses Terraform to create the following AWS resources:

* VPC
* Internet Gateways.
* elastic IPs.
* Public Nat Gateways
* Public EC2 instances.
* Private EC2 instances.
* Application Load balancer
* Network Load Balancer
* security groups for NLB. ALB and Ec2 instances.
* route tables
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
cd LAB4
```
Run ```terraform init``` to download the necessary Terraform plugins.

Run ```terraform plan``` to preview the changes that Terraform plans to make to your infrastructure. 

Run ```terraform apply``` to deploy your infrastructure. 

## verification
![Screenshot 2024-09-26 121559](https://github.com/user-attachments/assets/c3b4d9aa-c1eb-40aa-8dfd-158debc7904c)
![Screenshot_1](https://github.com/user-attachments/assets/58e37611-6a80-4391-939b-780e109b2b6e)
![Screenshot_2](https://github.com/user-attachments/assets/60793e34-fb30-4ff4-b839-1de1cb5e3ab1)


