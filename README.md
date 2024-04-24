## How to run

```bash
docker compose up --build
```

The cron is configured to run every 1 minute. Once you run the docker compose, you can wait for a minute and check the folder `database-backups` for the backup files.

## Restore a backup

To restore a backup, first create a database. In this case, we will create a database named `backup_restore`. Then uncompress the backup file and run the `pg_restore` command.

```bash
pg_restore -U postgres -h localhost -p 5432 -d backup_restore backup-2024-04-23-23-15-01.dump
```
