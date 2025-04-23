#!/bin/bash

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Function to log messages
log_message() {
    echo "$TIMESTAMP - $1" >> $LOG_FILE
}

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU_USAGE > 90" | bc -l) )); then
    log_message "WARNING: High CPU usage detected: ${CPU_USAGE}%"
else
    log_message "CPU usage is normal: ${CPU_USAGE}%"
fi

# Check memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEMORY_USAGE > 90" | bc -l) )); then
    log_message "WARNING: High memory usage detected: ${MEMORY_USAGE}%"
else
    log_message "Memory usage is normal: ${MEMORY_USAGE}%"
fi

# Check disk space
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -ge 90 ]; then
    log_message "WARNING: Low disk space detected: ${DISK_USAGE}% used"
else
    log_message "Disk space is sufficient: ${DISK_USAGE}% used"
fi

# Check if web server is running
if pgrep -x "nginx" > /dev/null; then
    log_message "Nginx web server is running"
else
    log_message "WARNING: Web server is not running"
fi

# Test API endpoints
for endpoint in "/students" "/subjects"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost$endpoint)
  if [[ "$STATUS" == "200" ]]; then
    echo "Endpoint $endpoint is OK." >> $LOG_FILE
  else
    echo "WARNING: $endpoint returned HTTP $STATUS." >> $LOG_FILE
  fi
done