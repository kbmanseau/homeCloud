#!/usr/bin/env bash
#sudo crontab -e
#0 * * * * /home/kbmanseau/homeCloud/confluence_db_backup.sh
#https://askubuntu.com/questions/990678/delete-old-backup-folders-from-directory-using-cron
HOME=/root
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/sh
PWD=/root

#Create daily backup folder
mkdir "/mergerFS/pool/atlassian/backups/$(date +\%Y-\%m-\%d)"

#Clean the backup folder to onl contain 14 backups
find /mergerFS/pool/atlassian/backups/ -mindepth 1 -maxdepth 1 -type d -print0 | sort -z | head -zn-14 | xargs -0 rm -rf
