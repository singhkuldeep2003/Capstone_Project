# Project 16: Enable HTTPS using ACM

## 1. Goal
Secure web application traffic by deploying an Application Load Balancer with an AWS Certificate Manager (ACM) SSL/TLS certificate, establishing an HTTPS listener on port 443, and blocking insecure HTTP traffic on port 80.

## 2. Infrastructure & Components
- **Load Balancer:** `project16-alb` (`project16-alb-1543902469.ap-south-1.elb.amazonaws.com`)
- **ACM Certificate ARN:** `arn:aws:acm:ap-south-1:590507089733:certificate/85631639-c9ad-4a49-9171-6a46fcdf36bc`
- **Target Group:** `capstone-p16-tg`
- **HTTPS Listener:** Port 443 forward to target group
- **HTTP Policy:** Port 80 connection refused / blocked

## 3. Verification Commands
```bash
# HTTPS (Port 443) Handshake & Response
curl -kvI [https://project16-alb-1543902469.ap-south-1.elb.amazonaws.com](https://project16-alb-1543902469.ap-south-1.elb.amazonaws.com)

# HTTP (Port 80) Blocked Verification
curl -I --connect-timeout 5 [http://project16-alb-1543902469.ap-south-1.elb.amazonaws.com](http://project16-alb-1543902469.ap-south-1.elb.amazonaws.com)
```

## 4. Deliverables
- Proof screenshot showing successful HTTPS handshake (HTTP/2 200) and blocked HTTP port 80 traffic.
