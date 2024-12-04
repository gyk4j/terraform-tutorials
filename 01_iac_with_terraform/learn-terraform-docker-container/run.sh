#!/bin/sh

# Download Terraform plugin to control Docker
terraform init

# Provision NGINX server container
terraform apply

# Check if NGINX instance Docker container is created
docker ps

# Destroy resources by stopping container
terraform destroy