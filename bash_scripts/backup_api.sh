#!/bin/bash

API_DIR="/var/www/html"
BACKUP_DIR="/home/ubuntu/backups"
BACKUP_LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date '+%Y-%m-%d')

mkdir -p $BACKUP_DIR
echo "[$TIMESTAMP] Starting backup..." >> $BACKUP_LOG_FILE

# API Project backup
tar -czf "$BACKUP_DIR/api_backup_$TIMESTAMP.tar.gz" $API_DIR
if [ $? -eq 0 ]; then
  echo "API files backed up successfully." >> $BACKUP_LOG_FILE
else
  echo "ERROR: API file backup failed!" >> $BACKUP_LOG_FILE
fi

# Cleanup old backups
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \; >> $BACKUP_LOG_FILE
