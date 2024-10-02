output "id" {
  value = aws_dynamodb_table.s3_table.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.lambda_bucket.id
}

