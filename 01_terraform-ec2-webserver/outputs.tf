output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "web_server_url" {
  description = "HTTP access URL"
  value       = "http://${aws_instance.web_server.public_ip}"
}
