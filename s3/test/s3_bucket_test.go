package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestS3Bucket(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/complete",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	bucketName := terraform.Output(t, terraformOptions, "bucket_name")
	bucketArn := terraform.Output(t, terraformOptions, "bucket_arn")

	assert.NotEmpty(t, bucketName)
	assert.NotEmpty(t, bucketArn)
}
