data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "s3_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  description = "An Amazon S3 trigger that retrieves metadata for the object that has been updated."
  filename      = "lambda_function_payload.zip"
  function_name = "s3-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  source_code_hash = data.archive_file.lambda.output_base64sha256
  handler = "lambda.lambda_handler"
  runtime = "python3.8"

  }

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.lambda_bucket.arn
}



resource "aws_s3_bucket_notification" "my-trigger" {
  bucket = aws_s3_bucket.lambda_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
  depends_on = [ aws_lambda_permission.lambda_permission ]
}

resource "aws_lambda_function_event_invoke_config" "destination" {
  function_name = aws_lambda_function.s3_lambda.function_name

  destination_config {
    on_success {
      destination = "arn:aws:sns:us-east-1:851725252127:my-email"
    }
  }
}


