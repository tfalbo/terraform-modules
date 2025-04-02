resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  logging {
    target_bucket = var.logging_bucket
    target_prefix = var.logging_prefix
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = ["s3:GetObject"]
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.this.arn}/*"
        Principal = "*"
      }
    ]
  })
}