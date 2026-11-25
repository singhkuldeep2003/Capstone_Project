# Project 22: S3 Log Archive with Lifecycle

## 1. Goal
Lower storage costs by automating object tier transitions and expiration for archived log files using Amazon S3 Lifecycle configurations.

## 2. Infrastructure & Policy
- **Target Bucket:** `aase-capstone-p02-d0c3e383b8a82d36dc7786ea59`
- **Prefix Filter:** `logs/`
- **Rule Name:** `ExpireLogsArchiveRule`
- **Lifecycle Actions:**
  - Transition to **GLACIER** after 30 days
  - Permanent **Expiration (Deletion)** after 90 days

## 3. Verification Commands
```bash
# List uploaded log objects
aws s3 ls s3://aase-capstone-p02-d0c3e383b8a82d36dc7786ea59/logs/ --human-readable

# Inspect applied lifecycle rules
aws s3api get-bucket-lifecycle-configuration --bucket aase-capstone-p02-d0c3e383b8a82d36dc7786ea59
```

## 4. Deliverables
- Proof screenshot displaying the active S3 lifecycle rule details in the AWS Management Console or AWS CLI.
