#!/bin/sh

# Initial configuration

cd learn-terraform-docker-container

terraform init

terraform apply

# Output Docker container configuration

touch outputs.tf
cat > outputs.tf <<EOL
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
EOL

# Inspect output values

terraform apply

terraform output

# Destroy infrastructure

terraform destroy
