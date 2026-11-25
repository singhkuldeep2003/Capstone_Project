#!/bin/bash
apt-get update -y
apt-get install -y nginx
echo "<h1>Backend Server 2 - Handled by EC2 Instance 2</h1>" > /var/www/html/index.html
systemctl restart nginx
