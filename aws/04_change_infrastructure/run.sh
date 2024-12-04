#!/bin/sh

# Prerequisites

cd learn-terraform-aws-instance

terraform init

terraform apply

# Configuration

## Edit main.tf by changing ami image id (Ubuntu)
## Force Terraform to destroy and re-create a new EC2 instance
sed -i 's/ami-830c94e3/ami-08d70e59c07c61a3a/' main.tf

terraform apply

## Print new EC2 instance id
terraform show



