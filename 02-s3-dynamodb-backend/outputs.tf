output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.tf_state_bucket.bucket
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.tf_state_locks.name
  description = "The name of the DynamoDB table"
}
