#!/usr/bin/env python3

import pathlib

# Search directory
print('Please wait, looking for a folder!')
currentDirectory = pathlib.Path(r'/home/')
currentPattern = "**/database-backup/"
for Dir in currentDirectory.glob(currentPattern):
    directory = Dir
print(directory)

# Requests new parameters
s3_bucket = input("S3_BUCKET (example/default: project-sql-backup): ") or "project-sql-backup"
s3_path = input("S3_PATH (example/default: sql-backup): ") or "sql-backup"
s3_access_key = input("AWS_ACCESS_KEY_ID (example/default: 11111111111111111111): ") or "11111111111111111111"
s3_secret_key = input("AWS_SECRET_ACCESS_KEY (example/default: 000000000000000000000000000000000000000): ") or "000000000000000000000000000000000000000"
s3_bucket_locatio = input("AWS_REGION (example/default: eu-central-1): ") or "eu-central-1"
db_name = input("DataBase Name (example: example_staging): ")
rds_host = input("RDS_HOST (example/default: project.cljbiszxn.eu-central-1.rds.amazonaws.com): ") or "project.cljbiszxn.eu-central-1.rds.amazonaws.com"
rds_db = input("RDS_DB (example/default: dbname): ") or "dbname"

# 1
# -*- coding: utf-8 -*-
# Opening the file read-only
backup = str(directory) + str('/sql-backup/backup.sh')
file = open(backup, 'r')
lines = file.readlines()
lines[14] = 'S3_BUCKET=' + s3_bucket + '\n'
lines[15] = 'S3_PATH=' + s3_path + '\n'
lines[16] = 'AWS_ACCESS_KEY_ID=' + s3_access_key + '\n'
lines[17] = 'AWS_SECRET_ACCESS_KEY=' + s3_secret_key + '\n'
lines[18] = 'AWS_REGION=' + s3_bucket_locatio + '\n'
lines[19] = 'DB=' + db_name + '\n'
lines[20] = 'RDS_HOST=' + rds_host + '\n'
lines[21] = 'RDS_DB=' + rds_db + '\n'
# Close the file
file.close()
 
# Opening the file for writing
save_changes = open(backup, 'w')
 
# Save the list of strings
save_changes.writelines(lines)
 
# Close the file
save_changes.close()

# 2
# Opening the file read-only
restore = str(directory) + str('/sql-restore/restore.sh')
file = open(restore, 'r')
lines = file.readlines()
lines[14] = 'S3_BUCKET=' + s3_bucket + '\n'
lines[15] = 'S3_PATH=' + s3_path + '\n'
lines[16] = 'AWS_ACCESS_KEY_ID=' + s3_access_key + '\n'
lines[17] = 'AWS_SECRET_ACCESS_KEY=' + s3_secret_key + '\n'
lines[18] = 'AWS_REGION=' + s3_bucket_locatio + '\n'
lines[19] = 'DB=' + db_name + '\n'
lines[20] = 'RDS_HOST=' + rds_host + '\n'
lines[21] = 'RDS_DB=' + rds_db + '\n'
# Close the file
file.close()
 
# Opening the file for writing
save_changes = open(restore, 'w')
 
# Save the list of strings
save_changes.writelines(lines)
 
# Close the file
save_changes.close()

# 3
# Opening the file read-only
backup_rds = str(directory) + str('/sql-backup/backup_rds.sh')
file = open(backup_rds, 'r')
lines = file.readlines()
lines[14] = 'S3_BUCKET=' + s3_bucket + '\n'
lines[15] = 'S3_PATH=' + s3_path + '\n'
lines[16] = 'AWS_ACCESS_KEY_ID=' + s3_access_key + '\n'
lines[17] = 'AWS_SECRET_ACCESS_KEY=' + s3_secret_key + '\n'
lines[18] = 'AWS_REGION=' + s3_bucket_locatio + '\n'
lines[19] = 'DB=' + db_name + '\n'
lines[20] = 'RDS_HOST=' + rds_host + '\n'
lines[21] = 'RDS_DB=' + rds_db + '\n'
# Close the file
file.close()
 
# Opening the file for writing
save_changes = open(backup_rds, 'w')
 
# Save the list of strings
save_changes.writelines(lines)
 
# Close the file
save_changes.close()

# 4 
# Opening the file read-only
restore_rds = str(directory) + str('/sql-restore/restore_rds.sh')
file = open(restore_rds, 'r')
lines = file.readlines()
lines[14] = 'S3_BUCKET=' + s3_bucket + '\n'
lines[15] = 'S3_PATH=' + s3_path + '\n'
lines[16] = 'AWS_ACCESS_KEY_ID=' + s3_access_key + '\n'
lines[17] = 'AWS_SECRET_ACCESS_KEY=' + s3_secret_key + '\n'
lines[18] = 'AWS_REGION=' + s3_bucket_locatio + '\n'
lines[19] = 'DB=' + db_name + '\n'
lines[20] = 'RDS_HOST=' + rds_host + '\n'
lines[21] = 'RDS_DB=' + rds_db + '\n'
# Close the file
file.close()
 
# Opening the file for writing
save_changes = open(restore_rds, 'w')
 
# Save the list of strings
save_changes.writelines(lines)
 
# Close the file
save_changes.close()
