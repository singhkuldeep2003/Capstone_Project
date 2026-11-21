output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.monitored_ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.monitored_ec2.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ec2_key -o StrictHostKeyChecking=no ubuntu@${aws_instance.monitored_ec2.public_ip}"
}

output "alarm_name" {
  description = "CloudWatch Alarm name"
  value       = aws_cloudwatch_metric_alarm.high_cpu_alarm.alarm_name
}
