#!/bin/sh

# Initial configuration

cd learn-terraform-aws-instance

terraform init

terraform apply

# Output EC2 instance configuration

touch outputs.tf
cat > outputs.tf <<EOL
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
EOL

# Inspect output values

terraform apply

# Query outputs

terraform output

# Destroy infrastructure

terraform destroy
