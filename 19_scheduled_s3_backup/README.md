# Project 19: Scheduled S3 Backup

## 1. Goal
Automate a routine backup procedure that archives server and web access logs and uploads timestamped archives to Amazon S3 using a scheduled cron job.

## 2. Infrastructure & Automation
- **Target Bucket:** ``
- **Backup Path:** `s3:///backups/logs/`
- **Scheduler:** Linux Cron (`0 2 * * *`)
- **Script:** `backup_logs_to_s3.sh`

## 3. Verification Commands
```bash
# Check cron schedule
crontab -l

# List S3 backup archives
aws s3 ls s3:///backups/logs/ --human-readable
```

## 4. Deliverables
- Proof screenshot showing active crontab configuration and uploaded backup archives in S3.
