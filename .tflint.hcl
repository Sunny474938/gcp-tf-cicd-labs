config {
  format = "compact"
}

plugin "google" {
  enabled = true
  source  = "github.com/terraform-linters/tflint-ruleset-google"
  version = "0.30.0"
}