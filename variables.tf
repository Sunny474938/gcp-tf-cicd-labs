variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Default region for lab resources"
  type        = string
  default     = "us-central1"
}