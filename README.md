# CS 421 - Assignment 1: API Deployment

This project implements a simple API with two endpoints as required by the assignment.

## Endpoints

1. `/students` - Returns a list of 10 students with their names and enrolled programs
2. `/subjects` - Returns all subjects in the Software Engineering program organized by academic year

## Setup Instructions

1. Clone this repository
2. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   venv\Scripts\activate

accessing the json files you must specify student or subject
1. localhost/5000/students for students
2. localhost/5000/subjects for subjects
 

 links to deployed server:
http://ec2-13-60-227-67.eu-north-1.compute.amazonaws.com/students
http://ec2-13-60-227-67.eu-north-1.compute.amazonaws.com/subjects


# Back up Schemes

1. Full Backup
Backs up all data, regardless of previous backups.

Advantages
- Complete copy of all data
- Simplest restoration process

Disadvantages
- Requires most storage
- Time consuming for large datasets

2. Incremental Backup
Backs up only the changes made since the last backup

Advantages
- Only backs up changed files since last backup
- Faster and uses less storage

Disadvantages
- More complex restoration( needs full + all increments)
- Dependecy chain between backups

3. Differential Backup
Backs up only the changes made since the last full backup

Advantages
- Only backs up changes since last full backup
- Easier restoration than incremental ( full + latest differential)

Disadvantages
- Larger than incremental backups
- Still requires full backup for complete restoration



# Bash Scripts

1. health_check.sh
- Monitors server resource usage and API health:

- Checks CPU, memory, and disk space usage.

- Verifies that the Nginx web server is running.

- Sends test requests to /students and /subjects API endpoints using curl.

- Logs results with timestamps to /var/log/server_health.log.

- Outputs warnings if any service is down or disk usage exceeds 90%.

- Every 6 hours

2. backup_api.sh
- Creates backups of the deployed API code:

- Archives the API directory (/var/www/html) to /home/ubuntu/backups/api_backup_<date>.tar.gz.

- Automatically deletes backups older than 7 days.

- Logs results to /var/log/backup.log.

- Daily at 2 AM

3. update_server.sh
- Updates the server and pulls the latest API code:

- Runs apt update && apt upgrade -y to update Ubuntu packages.

- Pulls new code from the GitHub repo.

- Restarts Nginx to apply updates.

- Logs all actions to /var/log/update.log.

- Every 3 days at 3 AM

Usage Instructions
for Permissions
- chmod +x bash_scripts/*.sh
Running manually
- sudo bash_scripts/health_check.sh
- sudo bash_scripts/backup_api.sh
- sudo bash_scripts/update_server.sh


Dependencies

- curl - for API endpoint testing
- git : for pulling updates
- cron : for scheduling automation
- tar : for creating backups
- nginx : web server
- systemctl : for managing services