#!/bin/sh

# Prerequisites

mkdir learn-terraform-docker-container

cd learn-terraform-docker-container

touch main.tf
cat > main.tf <<EOL
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
EOL

# Initialize the directory

terraform init

## Download the docker provider and installs it in a hidden subdirectory of 
## current working directory, named .terraform

# Format and validate the configuration

terraform fmt

terraform validate

# Create infrastructure

terraform apply

# Inspect state

terraform show

# Manually Managing State

terraform state list
