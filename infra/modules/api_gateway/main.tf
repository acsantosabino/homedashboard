resource "aws_apigatewayv2_api" "this" {
  count = var.create ? 1 : 0

  name          = var.api_name
  protocol_type = "HTTP"
  tags          = var.tags
}

resource "aws_apigatewayv2_integration" "lambda" {
  count = var.create ? 1 : 0

  api_id             = aws_apigatewayv2_api.this[0].id
  integration_type   = "AWS_PROXY"
  integration_uri    = var.lambda_function_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default" {
  count = var.create ? 1 : 0

  api_id    = aws_apigatewayv2_api.this[0].id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda[0].id}"
}

resource "aws_apigatewayv2_stage" "default" {
  count = var.create ? 1 : 0

  api_id      = aws_apigatewayv2_api.this[0].id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_gateway" {
  count = var.create ? 1 : 0

  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = aws_apigatewayv2_api.this[0].arn
}
