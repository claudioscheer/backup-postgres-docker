#!/bin/bash -e

db_user="$POSTGRES_USER"
db_password="$POSTGRES_PASSWORD"
db_host="$POSTGRES_HOST"
db_port="$POSTGRES_PORT"
db_name="$POSTGRES_DB"

echo "Starting backup for database $db_name"

date=$(date +%Y-%m-%d-%H-%M-%S)
filename="backup-$date.dump"

mkdir -p /backups

echo "Backup started at $(date)"
PGPASSWORD=$db_password pg_dump -F c -v -b -U $db_user -h $db_host -p $db_port $db_name > /backups/$filename
echo "Backup finished at $(date)"

echo "Compressing backup file"
gzip /backups/$filename
echo "Backup file compressed"

echo "Backup process finished at $(date)"
