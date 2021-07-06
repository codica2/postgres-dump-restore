#!/bin/bash

# Search directory
directory="$(find /home/ -name 'database-backup')"

# installation of basic programs 
echo -e '\e[35m____ 'Backup / Restore Utility' ____\e[0m'
echo -e '\e[35mSelect the desired action:\e[0m'
echo -e '\e[5m1.\e[0m \e[4m'Backup docker local database'\e[0m'
echo -e '\e[5m2.\e[0m \e[4m'Backup RDS database'\e[0m'
echo -e '\e[5m3.\e[0m \e[4m'Restore docker local database'\e[0m'
echo -e '\e[5m4.\e[0m \e[4m'Restore RDS database'\e[0m'
echo -e '\e[5m0.\e[0m \e[4m'Quit'\e[0m'


# input processing
read -n 1 -p 'Options: ' ans
echo ''
# check 0
if [ ${ans} -eq 0 ]; then echo -e "\e[32mBye!\e[0m" && exit; fi 

# selection of menu items
case "$ans" in
1) echo -e '\e[4m'Enter the parameters you need'\e[0m' && echo -e '\e[4mJust Enter to use default parameters\e[0m' && python3 $directory/info.py && bash $directory/sql-backup/backup.sh;;
2) echo -e '\e[4m'Enter the parameters you need'\e[0m' && echo -e '\e[4mJust Enter to use default parameters\e[0m' && python3 $directory/info.py && bash $directory/sql-backup/backup_rds.sh;;
3) echo -e '\e[4m'Enter the parameters you need'\e[0m' && echo -e '\e[4mJust Enter to use default parameters\e[0m' && python3 $directory/info.py && bash $directory/sql-restore/restore.sh;;
4) echo -e '\e[4m'Enter the parameters you need'\e[0m' && echo -e '\e[4mJust Enter to use default parameters\e[0m' && python3 $directory/info.py && bash $directory/sql-restore/restore_rds.sh;;
esac
echo -e "\e[1;32m!!!Ready!!!\e[0m"
