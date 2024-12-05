terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
#  project = "<PROJECT_ID>"
#  region  = "us-central1"
#  zone    = "us-central1-c"
  project = var.project
  region  = var.region
  zone    = var.zone
}