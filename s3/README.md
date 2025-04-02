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

## Testing

To run the Terratest for this module, follow these steps:

1. **Install Go**: Ensure you have Go installed on your machine. You can download and install it from [golang.org](https://golang.org/dl/).

2. **Set Up Go Environment**: Make sure your Go environment is set up correctly. You can verify this by running:
    ```sh
    go version
    ```

3. **Navigate to the Test Directory**: Change your directory to the `test` directory where the `s3_bucket_test.go` file is located.
    ```sh
    cd path/to/terraform-aws-s3-bucket/test
    ```

4. **Initialize Terraform**: Initialize the Terraform configuration in the `examples/complete` directory.
    ```sh
    cd ../examples/complete
    terraform init
    cd ../../test
    ```

5. **Run the Test**: Execute the Terratest using the `go test` command.
    ```sh
    go test -v
    ```

This will run the Terratest, which will:
- Initialize and apply the Terraform configuration in the `examples/complete` directory.
- Verify the outputs.
- Destroy the resources after the test completes.

### Example Commands
```sh
# Ensure Go is installed
go version

# Navigate to the test directory
cd path/to/terraform-aws-s3-bucket/test

# Initialize Terraform in the example directory
cd ../examples/complete
terraform init
cd ../../test

# Run the Terratest
go test -v
```

