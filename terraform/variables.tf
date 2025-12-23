variable "aws_region" {
  description = "AWS region where resources will be created (ex: us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally-unique S3 bucket name (lowercase recommended). Example: openshift-backup-data"
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "bucket_name must be between 3 and 63 characters."
  }

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must start/end with a letter or number and contain only lowercase letters, numbers, dots, or hyphens."
  }

  validation {
    condition     = !can(regex("\\.\\.", var.bucket_name))
    error_message = "bucket_name cannot contain consecutive periods (..)."
  }

  validation {
    condition     = !can(regex("^-|-$", var.bucket_name))
    error_message = "bucket_name cannot start or end with a hyphen."
  }
}

variable "environment" {
  description = "Environment tag (dev/test/prod)"
  type        = string
  default     = "dev"
}
