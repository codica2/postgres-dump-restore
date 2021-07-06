. /usr/local/bin/options
backup_dir="/sql-backup/"
date="$(date +'%d_%m_%Y_%H_%M')"
sql_file="backup-sql-${date}.sql"
        
PGPASSWORD=${PG_PASS} pg_dump ${OPTIONS} > ${backup_dir}/${sql_file}
aws s3 cp "${backup_dir}/${sql_file}" "s3://${S3_BUCKET}/${S3_PATH}/${sql_file}" > /dev/null 2>&1

if [[ ${?} -ne 0 ]]; then
	echo "Error!"
else
	echo "Done!"
fi
exit 0
