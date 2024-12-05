#!/bin/sh

# Prerequisites

# Set up GCP

PROJECT_ID=... copy and paste GCP generated project ID here ...

# Create Terraform configuration in its own working directory

mkdir learn-terraform-gcp

cd learn-terraform-gcp

# Create a new resource

cat >> main.tf <<EOL
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
EOL

# Create infrastructure

terraform apply

# Modify configuration

sed -Ei 's/(machine_type = "f1-micro")/\1\n  tags         = ["web", "dev"]/' main.tf

terraform apply

# Introduce destructive changes

sed -i 's|debian-cloud/debian-11|cos-cloud/cos-stable|' main.tf

terraform apply

## Inspect state

### View state data saved in "terraform.tfstate"
terraform show

