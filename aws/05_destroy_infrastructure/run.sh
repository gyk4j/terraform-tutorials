#!/bin/sh

# Assume we are continuing from previous tutorial, and `main.tf` exists.
cd learn-terraform-aws-instance

# Destroy resources managed by Terraform configuration
terraform destroy
