#!/bin/sh

# Prerequisites

# Set up GCP

PROJECT_ID=... copy and paste GCP generated project ID here ...

# Create Terraform configuration in its own working directory

mkdir learn-terraform-gcp

cd learn-terraform-gcp

touch main.tf

cat > main.tf <<EOL
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "<PROJECT_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
EOL

# Fill with real project ID
sed -i "s/<PROJECT_ID>/$PROJECT_ID/" main.tf

# Authenticate to Google Cloud
gcloud auth application-default login

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
