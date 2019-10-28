#!/usr/bin/env bash
#sudo crontab -e
#0 * * * * /home/kbmanseau/homeCloud/confluence_db_backup.sh
#HOME=/root
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#LANG=en_US.UTF-8
#SHELL=/bin/sh
#PWD=/root
#Grab confluence db dump and confluence data dir
kubectl exec -it -n atlassian $(kubectl get pod -n atlassian -l "app=postgres" -o name | sed 's/pod\///') -- /usr/bin/pg_dump -U postgres confluence > /mergerFS/pool/atlassian/backups/$(date +'%Y-%m-%d')/$(date +'%H:%M')-confluencedb.out
sudo tar -cf "/mergerFS/pool/atlassian/backups/$(date +"%Y-%m-%d")/$(date +'%H:%M')-confluencehome.tar" /mergerFS/pool/atlassian/confluence_data

#Grab jira db dump and jira data dir
kubectl exec -it -n atlassian $(kubectl get pod -n atlassian -l "app=postgres" -o name | sed 's/pod\///') -- /usr/bin/pg_dump -U postgres jira > /mergerFS/pool/atlassian/backups/$(date +'%Y-%m-%d')/$(date +'%H:%M')-jiradb.out
sudo tar -cf "/mergerFS/pool/atlassian/backups/$(date +"%Y-%m-%d")/$(date +'%H:%M')-jirahome.tar" /mergerFS/pool/atlassian/jira_data
