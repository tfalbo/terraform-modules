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

This setup allows you to use Terragrunt to manage the infrastructure created by your Terraform module, providing additional features like locking, remote state management, and more.

```hcl
module "s3_bucket" {
  source        = "path_to_module"
  bucket_name   = "my-bucket"
  logging_bucket = "my-logging-bucket"
  tags          = {
    Environment = "dev"
    Project     = "my-project"
  }
}
```

## Using Terragrunt

To use Terragrunt to manage the infrastructure created by this module, follow these steps:

1. **Install Terragrunt**: Ensure you have Terragrunt installed on your machine. You can download and install it from [terragrunt website](https://terragrunt.gruntwork.io/docs/getting-started/install/).

2. **Create a Terragrunt Configuration File**: Create a `terragrunt.hcl` file in a directory where you want to manage the infrastructure.

3. **Configure Terragrunt**: In the `terragrunt.hcl` file, specify the Terraform module source and any necessary inputs.

### Example `terragrunt.hcl` File (you can use the one provided by the module)

```hcl
terraform {
  source = "path_to_module"
}

inputs = {
  bucket_name    = "my-bucket"
  versioning     = true
  logging_bucket = "my-logging-bucket"
  logging_prefix = "logs/"
  tags = {
    Environment = "dev"
    Project     = "my-project"
  }
}
```

### Steps to Use Terragrunt

1. **Navigate to the Directory**: Change your directory to where the `terragrunt.hcl` file is located.
    ```sh
    cd path/to/terragrunt/directory
    ```

2. **Run Terragrunt Commands**: Use Terragrunt to manage the infrastructure.

    - **Initialize**: Initialize the Terraform configuration.
        ```sh
        terragrunt init
        ```

    - **Apply**: Apply the Terraform configuration to create or update the infrastructure.
        ```sh
        terragrunt apply
        ```

    - **Destroy**: Destroy the infrastructure managed by Terraform.
        ```sh
        terragrunt destroy
        ```

### Example Commands
```sh
# Navigate to the directory with terragrunt.hcl
cd path/to/terragrunt/directory

# Initialize the Terraform configuration
terragrunt init

# Apply the Terraform configuration
terragrunt apply

# Destroy the infrastructure
terragrunt destroy
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

