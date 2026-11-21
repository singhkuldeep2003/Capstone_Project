variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "capstone-s3-read-user"
}

variable "s3_read_actions" {
  description = "List of permitted S3 read actions stored as a variable"
  type        = list(string)
  default = [
    "s3:ListAllMyBuckets",
    "s3:ListBucket",
    "s3:GetObject"
  ]
}
