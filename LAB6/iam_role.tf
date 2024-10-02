data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam-for-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy_attachment" "s3_fullaccess_attach" {
  name       = "s3-full-access"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy_attachment" "db_fullaccess_attach" {
  name       = "db-full-access"
  roles      = [aws_iam_role.iam_for_lambda.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy_document" "AWSLambdaBasic_policy" {
  statement {
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:us-east-1:851725252127:*"]
  }

  statement {
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:us-east-1:851725252127:log-group:/aws/lambda/s3-lambda:*"]
  }
}

resource "aws_iam_policy" "AWSLambdaBasic" {
  name   = "AWSLambdaBasic"
  policy = data.aws_iam_policy_document.AWSLambdaBasic_policy.json
}

resource "aws_iam_policy_attachment" "AWSLambdaBasic-attach" {
  name = "AWSLambdaBasic-attach"
  roles = [ aws_iam_role.iam_for_lambda.name ]
  policy_arn = aws_iam_policy.AWSLambdaBasic.arn
}

data "aws_iam_policy_document" "LambdaSNSTopicDestination_policy" {
  statement {
    actions   = ["sns:Publish"]
    resources = ["arn:aws:sns:us-east-1:851725252127:my-email"]
  }
}

resource "aws_iam_policy" "LambdaSNSTopicDestination" {
  name   = "LambdaSNSTopicDestination"
  policy = data.aws_iam_policy_document.LambdaSNSTopicDestination_policy.json
}

resource "aws_iam_policy_attachment" "LambdaSNSTopicDestination-attach" {
  name = "LambdaSNSTopicDestination-attach"
  roles = [ aws_iam_role.iam_for_lambda.name ]
  policy_arn = aws_iam_policy.LambdaSNSTopicDestination.arn
}




