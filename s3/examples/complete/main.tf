provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source        = "../../"
  bucket_name   = "example-bucket"
  logging_bucket = "example-logging-bucket"
  tags          = {
    Environment = "dev"
    Project     = "example-project"
  }
}