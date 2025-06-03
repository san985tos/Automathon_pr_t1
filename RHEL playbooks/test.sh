#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
THRESHOLD=80
MOUNT_POINT="/"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
USAGE=$(/bin/df -P "$MOUNT_POINT" | /usr/bin/awk 'NR==2 {gsub("%",""); print $5}')
echo "$DATE - Uso disco en $MOUNT_POINT: $USAGE%" >> /root/disk_check.log
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    logger -t disk-monitor -p local0.warning "ALERTA: El uso del disco en '$MOUNT_POINT' es ${USAGE}%, sobre el umbral de ${THRESHOLD}%"
    echo "$DATE - ALERTA disparada" >> /root/disk_check.log
fi
curl -X POST https://disk-validation-aap.apps.cluster-7d5jn.7d5jn.sandbox1789.opentlc.com/ -H "Content-Type: application/json" -d '{"disk_usage": $USAGE}'