resource "aws_lambda_function" "this" {
  count = var.create ? 1 : 0

  function_name = var.function_name
  filename      = var.package_path
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}
