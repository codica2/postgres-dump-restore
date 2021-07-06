#!/usr/bin/env sh

set +e 

if [[ -z "${BACKUP_CRON_SCHEDULE}" ]]; then
  /usr/local/bin/restore
else
  BACKUP_CRON_SCHEDULE=${BACKUP_CRON_SCHEDULE}
  echo "${BACKUP_CRON_SCHEDULE} /usr/local/bin/restore" > /etc/crontabs/root
  echo "Starting cron ${BACKUP_CRON_SCHEDULE}" 
  crond -f -d 0 
fi
