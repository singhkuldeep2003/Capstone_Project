# Project 17: Log Forwarding to CloudWatch

## 1. Goal
Implement central log management by configuring AWS CloudWatch log groups and streaming system and web application logs directly to Amazon CloudWatch Logs.

## 2. Infrastructure & Configuration
- **Agent:** AWS CloudWatch Unified Agent
- **Region:** `ap-south-1`
- **Log Groups:**
  - `capstone-p17-nginx-logs` (`/var/log/nginx/access.log`)
  - `capstone-p17-system-logs` (`/var/log/syslog`)
- **Streams:** `vm-nginx-access`, `vm-syslog`

## 3. Verification Commands
```bash
# Check log groups
aws logs describe-log-groups --region ap-south-1 --log-group-name-prefix capstone-p17 --no-cli-pager

# Query events
aws logs get-log-events --region ap-south-1 --log-group-name capstone-p17-nginx-logs --log-stream-name vm-nginx-access --no-cli-pager
```

## 4. Deliverables
- Proof screenshot showing active CloudWatch Log Group streams receiving forwarded server logs.
