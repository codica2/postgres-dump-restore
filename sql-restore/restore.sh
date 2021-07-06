#!/bin/bash

############################################
##                                        ##
##        RESTORE DATABASE BACKUP         ##
##                                        ##
############################################

backup_dir="$HOME/sql-backup/"
date="$(date +'%d_%m_%Y_%H_%M')"
sql_file="backup-sql-$date.sql"
log_dir="$HOME/sql-backup/log/"
log_file="$HOME/sql-backup/log/backup.log"

S3_BUCKET=ubersholder-docker-testing
S3_PATH=folder
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=eu-central-1
DB=vvv
RDS_HOST=post.cisdyxg2qagb.eu-central-1.rds.amazonaws.com
RDS_DB=post
DB_USER=11
DB_HOST=11

if [ ! -d "${backup_dir}" ]; then
    mkdir ${backup_dir}
fi

if [ ! -d "${log_dir}" ]; then
    mkdir ${log_dir}
fi

if [ ! -f "${backup_dir}" ]; then
    touch ${log_file}
fi

db_restore(){
    echo -e "SQL restore in process ..."
    
    postgresql="pgsql"
    database_tipe="pgsql"

    if [[ "${database_tipe}" == "${postgresql}" ]]; then
        aws s3 cp s3://${S3_BUCKET}/${S3_PATH} ${backup_dir} --recursive --quiet --include "*" --region ${AWS_REGION} >> "${log_file}" &&
	    last_backup=$( echo $backup_dir$( ./lastfile.sh ${backup_dir} ) )
              echo $last_backup
	    RESULT=$(docker ps -q -f 'name=post') &&
      psql -h ${DB_HOST} -U ${DB_USER} -d ${DB} -f ${last_backup} &&
        echo -e "SQL restore finish ${last_backup}"

    fi
}

db_restore
