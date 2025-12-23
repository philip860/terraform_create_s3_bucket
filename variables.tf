variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = <<EOT
Optional: Full S3 bucket name (must be globally unique). If set (non-empty),
Terraform will use this exact name and will NOT append a random suffix.

If empty, Terraform will generate: <bucket_name_prefix>-<random_hex_suffix>
EOT
  type    = string
  default = ""

  validation {
    condition = (
      var.bucket_name == "" ||
      (
        length(var.bucket_name) >= 3 &&
        length(var.bucket_name) <= 63 &&
        can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
      )
    )
    error_message = "bucket_name must be 3-63 chars, lowercase letters/numbers/dots/hyphens, and start/end with a letter or number."
  }
}

variable "bucket_name_prefix" {
  description = "Prefix used only when bucket_name is empty. A random suffix is appended to ensure global uniqueness."
  type        = string
  default     = "demo-seed-bucket"

  validation {
    condition = (
      length(var.bucket_name_prefix) >= 1 &&
      length(var.bucket_name_prefix) <= 50 &&
      can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.bucket_name_prefix))
    )
    error_message = "bucket_name_prefix must be 1-50 chars, lowercase letters/numbers/hyphens, and start/end with a letter or number."
  }
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default = {
    Project = "terraform-s3-with-ansible-seed"
    Owner   = "example"
  }
}
