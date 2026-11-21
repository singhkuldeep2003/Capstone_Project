output "iam_user_name" {
  description = "The name of the IAM user"
  value       = aws_iam_user.s3_reader.name
}

output "policy_arn" {
  description = "The ARN of the attached S3 read policy"
  value       = aws_iam_policy.s3_read_policy.arn
}
