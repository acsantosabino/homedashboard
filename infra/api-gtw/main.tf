module "api_gateway" {
  source = "../modules/api_gateway"

  api_name            = var.api_name
  lambda_function_arn = var.lambda_function_arn
  tags                = var.common_tags
  create              = var.create_api
}
