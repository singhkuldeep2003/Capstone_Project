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

# 1. Adopt Default VPC & Subnet
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "Default subnet for ${var.aws_region}a"
  }
}

# 2. Upload SSH Key Pair
resource "aws_key_pair" "deployer_key" {
  key_name_prefix = "cw-monitor-key-"
  public_key      = file("${path.module}/ec2_key.pub")
}

# 3. Security Group (Allow SSH)
resource "aws_security_group" "ssh_sg" {
  name_prefix = "cw-ec2-ssh-sg-"
  description = "Allow inbound SSH traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cw-ec2-ssh-sg"
  }
}

# 4. Ubuntu 22.04 LTS AMI Data Source
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 5. EC2 Instance with stress tool installed
resource "aws_instance" "monitored_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_default_subnet.default_az1.id
  vpc_security_group_ids      = [aws_security_group.ssh_sg.id]
  key_name                    = aws_key_pair.deployer_key.key_name
  associate_public_ip_address = true

  # Pre-install the stress package on boot
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y stress
              EOF

  tags = {
    Name = "CloudWatch-Monitored-EC2"
  }
}

# 6. CloudWatch Metric Alarm for High CPU Utilization
resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "ec2-high-cpu-utilization-${aws_instance.monitored_ec2.id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Alarm triggers when EC2 CPU exceeds ${var.cpu_threshold}%"

  dimensions = {
    InstanceId = aws_instance.monitored_ec2.id
  }
}
