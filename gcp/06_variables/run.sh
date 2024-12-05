#!/bin/sh

# Define input variables

touch variables.tf
cat > variables.tf <<EOL
variable "project" { }

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}
EOL

# Use variables in configuration

sed -i 's/"<PROJECT_ID>"/var.project/' main.tf
sed -i 's/"us-central1"/var.region/' main.tf
sed -i 's/"us-central1-c"/var.zone/' main.tf

# Terraform loads all files in the current directory ending in .tf, so you can 
# name your configuration files however you choose i.e. `main.tf` does NOT need
# to explicitly include or reference `variables.tf`.

# Apply your configuration with value from file
terraform apply

# Assign values to your variables from .tfvars file

touch terraform.tfvars
cat > terraform.tfvars <<EOL
project = "1234567890"
EOL

terraform apply

# Apply new configuration overriding variable value using command line argument
terraform apply -var "zone=us-central1-a"


