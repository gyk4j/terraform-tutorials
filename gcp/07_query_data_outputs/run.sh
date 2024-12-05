#!/bin/sh

# Initial configuration

cd learn-terraform-gcp

# Define outputs

touch outputs.tf
cat > outputs.tf <<EOL
output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}
EOL

# Inspect output

terraform apply

# Query outputs

terraform output

# Destroy infrastructure

terraform destroy
