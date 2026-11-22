variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
  default     = "CloudWatch-Monitored-EC2"
}
