terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Dynamic SSH key pair (no gitignored local file dependency)
resource "tls_private_key" "ec2_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "${var.instance_name}-key"
  public_key = tls_private_key.ec2_ssh_key.public_key_openssh
}

# 2. Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for EC2 monitoring"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. Monitored EC2 Instance
resource "aws_instance" "monitored_ec2" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name        = var.instance_name
    Project     = "Capstone"
    Environment = "Training"
  }
}

# 4. CloudWatch CPU Metric Alarm (high_cpu_alarm matches outputs.tf)
resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "ec2-high-cpu-utilization-${aws_instance.monitored_ec2.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Alarm when EC2 CPU utilization exceeds 50 percent"

  dimensions = {
    InstanceId = aws_instance.monitored_ec2.id
  }
}
