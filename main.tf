locals {
  bucket_suffix = var.environment == "prod" ? "" : "-${var.environment}"
}

terraform {
  required_version = ">= 1.15.8"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# resource "google_storage_bucket" "materials_yard" {
#   name                        = "${var.project_id}-materials-yard"
#   location                    = var.region
#   storage_class               = "STANDARD"
#   uniform_bucket_level_access = true
#   force_destroy               = true

#   versioning {
#     enabled = false
#   }
# }

resource "google_storage_bucket" "materials_yard" {
  name                        = "${var.project_id}-materials-yard${local.bucket_suffix}"
  location                    = var.region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  force_destroy               = var.environment == "dev" ? true : false

  versioning {
    enabled = var.environment == "prod" ? true : false
  }

  labels = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

