terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. IAM User
resource "aws_iam_user" "s3_reader" {
  name          = var.iam_user_name
  force_destroy = true

  tags = {
    Project     = "Capstone"
    Environment = "Training"
  }
}

# 2. IAM Policy using the actions defined in variable
resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.iam_user_name}-policy"
  description = "Policy granting S3 read-only access from variables"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowS3ReadActions"
        Effect   = "Allow"
        Action   = var.s3_read_actions
        Resource = "*"
      }
    ]
  })
}

# 3. Attach Policy to User
resource "aws_iam_user_policy_attachment" "attach_s3_read" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
