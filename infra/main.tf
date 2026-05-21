module "frontend" {
  source      = "./frontend"
  project_name = var.project_name
  environment  = var.environment
  aws_region    = var.aws_region
}

module "backend" {
  source      = "./backend"
  project_name = var.project_name
  environment  = var.environment
  aws_region    = var.aws_region
}

module "api_gtw" {
  source      = "./api-gtw"
  project_name = var.project_name
  environment  = var.environment
  aws_region    = var.aws_region
  lambda_function_arn = module.backend.lambda_function_arn
}
