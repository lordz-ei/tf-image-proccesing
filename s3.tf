#Create S3 Buckets using terraform-aws-modules
module "original_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.5"

  bucket = var.original_image_bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}


module "transformed_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.5"

  bucket = var.transformed_image_bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}


module "cloudfront_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.5"

  bucket = var.cloudfront_log_bucket_name
  acl    = "log-delivery-write"
  
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}