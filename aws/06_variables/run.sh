#!/bin/sh

# Prerequisites

cd learn-terraform-aws-instance

terraform init

# Set the instance name with a variable

touch variables.tf
cat > variables.tf << EOL
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
EOL

# Terraform loads all files in the current directory ending in .tf, so you can 
# name your configuration files however you choose i.e. `main.tf` does NOT need
# to explicitly include or reference `variables.tf`.

# Apply your configuration with value from file
terraform apply

# Apply new configuration overriding variable value using command line argument
terraform apply -var "instance_name=YetAnotherName"


