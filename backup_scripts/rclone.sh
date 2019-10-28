#!/usr/bin/env bash
#sudo crontab -e
#0 * * * * /home/kbmanseau/homeCloud/confluence_db_backup.sh
#HOME=/root
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#LANG=en_US.UTF-8
#SHELL=/bin/sh
#PWD=/root

#Make backup archive
sudo tar -cf "/mergerFS/pool/atlassian/archive/$(date +"%Y-%m-%d").tar" /mergerFS/pool/atlassian/backups/$(date +"%Y-%m-%d")

#Clean archive loaction, keep 14 newest copies
sudo find /mergerFS/pool/atlassian/archive/ -mindepth 1 -maxdepth 1 -type f -print0 | sort -z | head -zn-14 | xargs -0 rm -rf

#Sync archive folder to google drive
rclone sync /mergerFS/pool/atlassian/archive/ remote:"/Atlassian Backups"
