#!/bin/bash
apt-get update -y
apt-get install -y nginx

systemctl start nginx
systemctl enable nginx

cat <<'HTML' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Web Server Deployed via Terraform</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 10%; background-color: #f4f6f8; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); display: inline-block; }
        h1 { color: #232f3e; }
        p { color: #555; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Terraform Web Server Live</h1>
        <p>Deployed on AWS EC2 inside a custom VPC.</p>
    </div>
</body>
</html>
HTML
