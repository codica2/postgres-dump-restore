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

db_restore(){
    echo -e "SQL restore backup process ..."
    
    postgresql="pgsql"
    database_tipe="pgsql"

    if [[ "${database_tipe}" == "${postgresql}" ]]; then
        
        aws s3 cp s3://${S3_BUCKET}/${S3_PATH} ${backup_dir} --recursive --quiet --include "*" --region ${AWS_REGION} >> "${log_file}" 2>&1 &&
            echo -e "\e[32mDONE!\e[0m" || echo -e "\e[31mERROR...\e[0m" 
            last_backup=$( echo $backup_dir$( ./lastfile.sh ${backup_dir} ) )
        psql -h ${RDS_HOST} -Upostgres -d ${RDS_DB} -f ${last_backup}  &&
        echo "SQL backup finish ${backup_dir}/${sql_file}" >> "${log_file}" &&
        echo -e "\e[32mSQL backup finish ${backup_dir}/${sql_file}\e[0m"

    fi
}

db_restore
