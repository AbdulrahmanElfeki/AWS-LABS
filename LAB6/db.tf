resource "aws_dynamodb_table" "s3_table" {
  name           = "s3-table"
  hash_key       = "id"
  billing_mode     = "PROVISIONED"
  deletion_protection_enabled = false
  table_class = "STANDARD"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "id"
    type = "S"  # String type for the partition key
  }
}
