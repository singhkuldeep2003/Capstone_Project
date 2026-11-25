#!/bin/bash
apt-get update -y
apt-get install -y nginx
echo "<h1>Backend Server 1 - Handled by EC2 Instance 1</h1>" > /var/www/html/index.html
systemctl restart nginx
