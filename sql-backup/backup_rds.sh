#!/bin/bash

############################################
##                                        ##
##           DATABASE BACKUP              ##
##                                        ##
############################################

backup_dir="$HOME/sql-backup/"
date="$(date +'%d_%m_%Y_%H_%M')"
sql_file="backup-sql-$date.sql"
log_dir="$HOME/sql-backup/log/"
log_file="$HOME/sql-backup/log/backup.log"

S3_BUCKET=ubersholder-docker-testing
S3_PATH=folder/
AWS_ACCESS_KEY_ID=1
AWS_SECRET_ACCESS_KEY=1
AWS_REGION=eu-central-1
DB=vvv
RDS_HOST=post.cisdyxg2qagb.eu-central-1.rds.amazonaws.com
RDS_DB=postgres

if [ ! -d "${backup_dir}" ]; then
    mkdir ${backup_dir}
fi

if [ ! -d "${log_dir}" ]; then
     mkdir ${log_dir}
fi

if [ ! -f "${backup_dir}" ]; then
    touch ${log_file}
fi

db_backup(){
    echo -e "SQL backup process \e[5m...\e[0m"

    postgresql="pgsql"
    database_tipe="pgsql"

    if [[ "${database_tipe}" == "${postgresql}" ]]; then

        pg_dump -h ${RDS_HOST} -Upostgres -d ${RDS_DB} > ${backup_dir}/${sql_file} &&
        echo "SQL backup finished ${backup_dir}/${sql_file}" >> "${log_file}" &&
        echo -e "\e[32mSQL backup finished ${backup_dir}${sql_file}\e[0m"
        echo -e "Copy backup to S3 \e[5m...\e[0m"
        aws s3 cp "${backup_dir}/${sql_file}" "s3://${S3_BUCKET}/${S3_PATH}/${sql_file}" >> "${log_file}" 2>&1 &&
            echo -e "\e[32mDONE!\e[0m" || echo -e "\e[31mERROR...\e[0m"
        
    fi
}

db_backup
