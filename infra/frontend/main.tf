module "frontend_bucket" {
  source = "../modules/s3_bucket"

  bucket_name = var.frontend_bucket_name
  tags        = var.common_tags
  versioning  = true
  create      = true
}

module "frontend_distribution" {
  source = "../modules/cloudfront"

  bucket_name         = module.frontend_bucket.bucket_name
  origin_access_identity = null
  create_distribution = var.create_frontend_distribution
  tags                = var.common_tags
}
