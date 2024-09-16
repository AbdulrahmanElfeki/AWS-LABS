# create Administrators group
resource "aws_iam_group" "Administrators" {
  name = "Administrators"
}

# create Group policy for Administrators
resource "aws_iam_group_policy_attachment" "policy-attched" {
  group      = aws_iam_group.Administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# create IAM user 
resource "aws_iam_user" "Elfeki" {
  name = "AbdulrahmanElfeki"
}

# create IAM user Acces key
resource "aws_iam_access_key" "Elfeki" {
  user = aws_iam_user.Elfeki.name
}

# attach user to Administrators group
resource "aws_iam_user_group_membership" "Administrators_membership" {
  user = aws_iam_user.Elfeki.name
  groups = [aws_iam_group.Administrators.name]
}