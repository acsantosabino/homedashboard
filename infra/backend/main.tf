module "lambda_role" {
  source = "../modules/role"

  role_name           = "${var.project_name}-backend-${var.environment}-lambda"
  assume_service      = "lambda.amazonaws.com"
  managed_policy_arns = var.lambda_managed_policy_arns
  tags                = var.common_tags
  create              = var.create_lambda
}

module "backend_lambda" {
  source = "../modules/lambda"

  function_name = var.lambda_function_name
  role_arn      = module.lambda_role.role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  package_path  = var.lambda_package_path
  environment   = var.environment
  create        = var.create_lambda
}
