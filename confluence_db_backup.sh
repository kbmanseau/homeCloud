#!/usr/bin/env bash
HOME=/root
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/sh
PWD=/root
kubectl exec -it -n atlassian $(kubectl get pod -n atlassian -l "app=postgres" -o name | sed 's/pod\///') -- /usr/bin/pg_dump -U postgres confluence > "/mergerFS/pool/atlassian/database_backups/confluence_db/confluenceDB_$(date +"%Y-%m-%d_%H:%M").out"

