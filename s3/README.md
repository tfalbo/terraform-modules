# terraform-aws-s3-bucket

This module creates an S3 bucket with best practices for security, scalability, and reliability. 


## Inputs

| Name           | Description                       | Type   | Default | Required |
|----------------|-----------------------------------|--------|---------|----------|
| bucket_name    | The name of the S3 bucket         | string | n/a     | yes      |
| versioning     | Enable versioning                 | bool   | true    | no       |
| logging_bucket | The bucket to store logs          | string | ""      | no       |
| logging_prefix | The prefix for log objects        | string | "logs/" | no       |
| tags           | A map of tags to assign to bucket | map    | {}      | no       |

## Outputs

| Name        | Description              |
|-------------|--------------------------|
| bucket_name | The name of the S3 bucket|
| bucket_arn  | The ARN of the S3 bucket |


## Usage

An example of how to use this module can be found in examples/complete/main.tf.

```
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
```

