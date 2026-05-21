output "function_name" {
  value = aws_lambda_function.this[0].function_name
  condition = length(aws_lambda_function.this) > 0
}

output "function_arn" {
  value = aws_lambda_function.this[0].arn
  condition = length(aws_lambda_function.this) > 0
}
