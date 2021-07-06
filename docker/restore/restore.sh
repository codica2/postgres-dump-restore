. /usr/local/bin/options

backup_dir="/sql-backup/"
date="$(date +'%d_%m_%Y_%H_%M')"

aws s3 cp s3://${S3_BUCKET}/${S3_PATH} ${backup_dir} --recursive --quiet --include “*” --region ${AWS_DEFAULT_REGION}

sql_file="backup-sql-${date}.sql"
sleep 15
last_backup=`lastfile ${backup_dir}`

fix=$(echo ${last_backup} | sed 's/ //g' 2> /dev/null)
OPTS=$(echo ${OPTIONS} | sed "s/'//")
FINAL="${backup_dir}${fix}"

PGPASSWORD=${PG_PASS} psql ${OPTS} < "${FINAL}" -d ${PG_NAME}

