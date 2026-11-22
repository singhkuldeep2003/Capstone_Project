# Standard resource tags for compliance and tracking
locals {
  common_tags = {
    ManagedBy   = "Terraform"
    Environment = "Capstone-Production"
    Owner       = "singhkuldeep2003"
    UpdatedDate = "2026-11-22"
  }
}
