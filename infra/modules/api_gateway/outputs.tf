output "api_id" {
  value = aws_apigatewayv2_api.this[0].id
  condition = length(aws_apigatewayv2_api.this) > 0
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.this[0].api_endpoint
  condition = length(aws_apigatewayv2_api.this) > 0
}
