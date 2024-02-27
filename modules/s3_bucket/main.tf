resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  # You can remove the server_side_encryption_configuration block from here
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_sse_configuration" {
  bucket = aws_s3_bucket.example_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.example_bucket.arn}/*" # Directly specify bucket ARN
      },
    ]
  })
}
