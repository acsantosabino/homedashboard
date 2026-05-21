output "bucket_name" {
  value = module.frontend_bucket.bucket_name
}

output "distribution_id" {
  value = module.frontend_distribution.distribution_id
}

output "distribution_domain_name" {
  value = module.frontend_distribution.distribution_domain_name
}
