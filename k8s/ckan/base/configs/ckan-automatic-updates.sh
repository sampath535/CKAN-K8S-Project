#!/bin/bash -l
. /usr/lib/ckan/orsted-ckan/bin/activate

export API_KEY=$(cat /etc/ckan_secrets/CKAN_API_KEY)
export CKAN_QUEUE_CONN_STRING=$(cat /etc/ckan_secrets/CKAN_QUEUE_CONN_STRING)
export PYTHONWARNINGS="ignore:Unverified HTTPS request"

queue_url="$AZURE_QUEUE_URL"

python3 /usr/lib/ckan/orsted-scripts/scripts/project_import/main.py --api-key $API_KEY --url "$CKAN_SITE_URL"/api/3 --ssl-no-verify --azure-queue-name ckan --azure-queue-archive-path /var/lib/ckan/msg-backup --azure-queue-connection-string "$AZURE_QUEUE_CONN"+"$CKAN_QUEUE_CONN_STRING"
