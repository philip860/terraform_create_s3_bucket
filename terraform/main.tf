resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  bucket_name = lower("${var.bucket_name_prefix}-${random_id.suffix.hex}")
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
  tags   = var.tags
}

# Block all public access (recommended default)
resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Default encryption (SSE-S3). For SSE-KMS, swap algorithm + add kms_master_key_id.
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  description = "Created bucket name."
  value       = aws_s3_bucket.this.bucket
}
