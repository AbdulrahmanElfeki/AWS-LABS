resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-bucket-for-me"

  tags = {
    Name        = "My bucket"
  }
}


resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

