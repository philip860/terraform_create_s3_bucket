variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name_prefix" {
  description = "Prefix for the bucket name. A random suffix is appended to ensure global uniqueness."
  type        = string
  default     = "demo-seed-bucket"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default = {
    Project = "terraform-s3-with-ansible-seed"
    Owner   = "example"
  }
}
