variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "cpu_threshold" {
  description = "CPU utilization alarm threshold percentage"
  type        = number
  default     = 50
}
