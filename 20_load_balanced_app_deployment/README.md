# Project 20: Load Balanced App Deployment

## 1. Goal
Improve application scale and performance by deploying multiple backend EC2 instances behind an Application Load Balancer with configured HTTP health checks.

## 2. Infrastructure & Components
- **Load Balancer:** `project20-alb` (`project20-alb-1858164163.ap-south-1.elb.amazonaws.com`)
- **Target Group:** `azltt0222435e27-p20-tg` (`arn:aws:elasticloadbalancing:ap-south-1:590507089733:targetgroup/azltt0222435e27-p20-tg/a6f697ac510a055f`)
- **Health Check Path:** `/` (HTTP Port 80, Matcher: 200)
- **Registered Targets:** `i-0b05e677c3bc3192c`, `i-0449dbe5a6b329b75` (Both Healthy)

## 3. Verification Commands
```bash
# Inspect target health status
aws elbv2 describe-target-health --region ap-south-1 --target-group-arn arn:aws:elasticloadbalancing:ap-south-1:590507089733:targetgroup/azltt0222435e27-p20-tg/a6f697ac510a055f --output table

# Test load distribution
for i in {1..6}; do curl -s http://project20-alb-1858164163.ap-south-1.elb.amazonaws.com; done
```

## 4. Deliverables
- Proof screenshot showing both targets healthy in the target group and active HTTP responses through the ALB.
