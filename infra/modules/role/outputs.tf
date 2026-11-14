output "role_arn" {
  value = aws_iam_role.this[0].arn
  condition = length(aws_iam_role.this) > 0
}

output "role_name" {
  value = aws_iam_role.this[0].name
  condition = length(aws_iam_role.this) > 0
}
