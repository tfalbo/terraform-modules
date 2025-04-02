terraform {
  source = "path_to_module"
}

inputs = {
  bucket_name   = "terragrunt-bucket"
  logging_bucket = "terragrunt-logging-bucket"
  tags          = {
    Environment = "dev"
    Project     = "terragrunt-project"
  }
}