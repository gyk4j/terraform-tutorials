#!/bin/sh

# Prerequisites

## Update ami if region is changed
## No default VPC in region. Create new custom VPC, security group and subnet. 

## Set IAM credentials
export AWS_ACCESS_KEY_ID=

## Set secret key
export AWS_SECRET_ACCESS_KEY=

# Create Terraform configuration in its own working directory

mkdir learn-terraform-aws-instance
cd learn-terraform-aws-instance
touch main.tf

# Initialize the directory

## Download provider(s) and create lock file
terraform init

# Format and validate configuration

## Format configuration file
terraform fmt

## Validate configuration
terraform validate

# Create infrastructure

terraform apply

## Inspect state

### View state data saved in "terraform.tfstate"
terraform show

### Manually Managing State

#### List resources in current state
terraform state list

