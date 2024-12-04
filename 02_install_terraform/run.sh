#!/bin/sh

# Install Terraform

## Manual installation

TF_VERSION=1.10.0

### Windows

curl -O https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_windows_amd64.zip
unzip terraform_${TF_VERSION}_windows_amd64.zip
set PATH=%PATH%;%CD%

### Linux

curl -O https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_${TF_VERSION}_linux_amd64.zip
unzip terraform_${TF_VERSION}_linux_amd64.zip
mv terraform /usr/local/bin

## Windows (Chocolatey)

choco install terraform

## Linux

### Ubuntu/Debian

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

### CentOS/RHEL

sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform

### Fedora

sudo dnf install -y dnf-plugins-core

sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

sudo dnf -y install terraform

# Verify installation

terraform -help

terraform -help plan

# Enable tab completion

## Bash

touch ~/.bashrc

terraform -install-autocomplete

## Zsh

touch ~/.zshrc

terraform -install-autocomplete

# Quick start tutorial

mkdir learn-terraform-docker-container

cd learn-terraform-docker-container

## Create [main.tf](main.tf)

terraform init
terraform apply

curl http://localhost:8000
docker ps

terraform destroy
