#!/bin/bash

UPDATE_LOG_FILE="/var/log/update.log"
REPO_DIR="/var/www/html"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] Updating system and API..." >> $UPDATE_LOG_FILE
apt update && apt upgrade -y >> $UPDATE_LOG_FILE 2>&1

cd $REPO_DIR
if git pull origin master>> $UPDATE_LOG_FILE 2>&1; then
  echo "Pulled latest code from GitHub." >> $UPDATE_LOG_FILE
  systemctl restart nginx
  echo "Nginx restarted." >> $UPDATE_LOG_FILE
else
  echo "ERROR: Git pull failed. Nginx not restarted." >> $UPDATE_LOG_FILE
  exit 1
fi
