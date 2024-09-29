resource "aws_s3_bucket" "static_host" {
  bucket = "static-web-host-for-me"

  tags = {
    Name        = "My bucket"
  }
}


resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.static_host.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_host.id
   index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "allow_access_to_website_object" {
  bucket = aws_s3_bucket.static_host.id
  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "Policy1727587791168",
    Statement = [
      {
        Sid       = "Stmt1727587789258",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:*",
        Resource  = "arn:aws:s3:::static-web-host-for-me/*",
      },
    ],
  })
}


