#!/usr/bin/env bash
#sudo crontab -e
#0 * * * * /home/kbmanseau/homeCloud/confluence_db_backup.sh
HOME=/root
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/sh
PWD=/root
kubectl exec -it -n atlassian $(kubectl get pod -n atlassian -l "app=postgres" -o name | sed 's/pod\///') -- /usr/bin/pg_dump -U postgres confluence > /mergerFS/pool/atlassian/backups/$(date +'%Y-%m-%d')/db-T$(date +'%H:%M').out
tar -cf "/mergerFS/pool/atlassian/backups/$(date +"%Y-%m-%d")/home-T$(date +'%H:%M').tar" /mergerFS/pool/atlassian/confluence_data
