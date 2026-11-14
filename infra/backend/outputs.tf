output "lambda_function_name" {
  value = module.backend_lambda.function_name
}

output "lambda_function_arn" {
  value = module.backend_lambda.function_arn
}

output "lambda_role_arn" {
  value = module.lambda_role.role_arn
}
