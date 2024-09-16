output "iam_user" {
    description="describe IAM user name"
    value = aws_iam_user.Elfeki.name
}

output "iam_user_group" {
    description="describe IAM user group "
    value = aws_iam_group.Administrators.name
}