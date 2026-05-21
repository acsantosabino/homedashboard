output "distribution_id" {
  value = aws_cloudfront_distribution.this[0].id
  condition = length(aws_cloudfront_distribution.this) > 0
}

output "distribution_domain_name" {
  value = aws_cloudfront_distribution.this[0].domain_name
  condition = length(aws_cloudfront_distribution.this) > 0
}
