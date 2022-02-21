terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3             = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket        = "tf-state-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_bucket_access" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tf_state_locks" {
  name         = "tf_state_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}