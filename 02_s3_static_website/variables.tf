variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket"
  type        = string
  default     = "capstone-s3-website"
}
