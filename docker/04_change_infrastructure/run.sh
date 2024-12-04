#!/bin/sh

# Prerequisites

mkdir learn-terraform-docker-container

cd learn-terraform-docker-container

terraform init

terraform apply

# Update configuration

sed -i 's/external = 8000/external = 8080/' main.tf

# Apply Changes

terraform apply

terraform show
