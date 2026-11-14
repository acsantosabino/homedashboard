resource "aws_cloudfront_distribution" "this" {
  count = var.create_distribution ? 1 : 0

  origin {
    domain_name = format("%s.s3.amazonaws.com", var.bucket_name)
    origin_id   = var.bucket_name
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_name

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = var.tags
}
