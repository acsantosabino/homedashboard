output "frontend_bucket_name" {
  value = module.frontend.bucket_name
}

output "frontend_distribution_id" {
  value = module.frontend.distribution_id
}

output "backend_lambda_name" {
  value = module.backend.lambda_function_name
}

output "api_gateway_url" {
  value = module.api_gtw.api_endpoint
}
