#!/bin/sh

# Prerequisites

cd learn-terraform-aws-instance

terraform init

terraform apply

# Set up HCP Terraform

# Sign up: https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up

# modify `main.tf` to add a cloud block to your Terraform configuration, and 
# replace organization-name with your organization name.
# See *Begin Add* and *End Add* block

# Login to HCP Terraform

terraform login

# Terraform will request an API token for app.terraform.io using your browser.
#
# If login is successful, Terraform will store the token in plain text in
# the following file for use by subsequent commands:
#     /Users/<USER>/.terraform.d/credentials.tfrc.json
#
# See: https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-login

# Initialize Terraform

## Re-initialize configuration and migrate state file to HCP Terraform after 
## configuring HCP Terraform integration
terraform init

## Delete local state file after migration to HCP Terraform
rm terraform.tfstate

# Set workspace variables

## Workspace > learn-terraform-aws > Variables page
### Add and mark as Sensitive: AWS_ACCESS_KEY_ID=...
### Add and mark as Sensitive: AWS_SECRET_ACCESS_KEY=...

# Apply the configuration

terraform apply

# Destroy your infrastructure

terraform destroy
