
variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Optional full S3 bucket name. If empty, bucket_name_prefix + random suffix is used."
  type        = string
  default     = ""

  validation {
    condition = (
      var.bucket_name == "" ||
      (
        length(var.bucket_name) >= 3 &&
        length(var.bucket_name) <= 63 &&
        can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name))
      )
    )
    error_message = "bucket_name must be 3-63 chars, lowercase letters, numbers, dots or hyphens."
  }
}

variable "bucket_name_prefix" {
  description = "Prefix used when bucket_name is empty."
  type        = string
  default     = "demo-seed-bucket"
}

variable "tags" {
  description = "Tags to apply to the bucket."
  type        = map(string)
  default = {
    Project = "terraform-s3-with-ansible-seed"
    Owner   = "example"
  }
}
