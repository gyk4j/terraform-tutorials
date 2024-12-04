#!/bin/sh

# Prerequisites

cd learn-terraform-docker-container

terraform init

# Set the container name with a variable

touch variables.tf
cat > variables.tf << EOL
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}
EOL
sed -i 's/name  = "tutorial"/name = var.container_name/' main.tf

# Apply your configuration

terraform apply

terraform apply -var "container_name=YetAnotherName"
