#!/bin/bash
set -e

# Configuration
BACKUP_DIR="/tmp/log_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_backup_${TIMESTAMP}.tar.gz"
S3_BUCKET=""
S3_PREFIX="backups/logs"

# Ensure local backup directory exists
mkdir -p "${BACKUP_DIR}"

# Archive available log files
tar -czf "${BACKUP_DIR}/${ARCHIVE_NAME}" -C /var/log nginx syslog 2>/dev/null || tar -czf "${BACKUP_DIR}/${ARCHIVE_NAME}" -C /var/log nginx 2>/dev/null

# Upload to Amazon S3
aws s3 cp "${BACKUP_DIR}/${ARCHIVE_NAME}" "s3://${S3_BUCKET}/${S3_PREFIX}/${ARCHIVE_NAME}" --region ap-south-1

# Clean up local archive
rm -f "${BACKUP_DIR}/${ARCHIVE_NAME}"

echo "[$(date)] Backup ${ARCHIVE_NAME} successfully uploaded to s3://${S3_BUCKET}/${S3_PREFIX}/"
