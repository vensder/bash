#!/bin/sh

PATTERN='ntpd -u ntp:ntp -p /var/run/ntpd.pid -g'
SERVICE="/sbin/service"
PGREP="/usr/bin/pgrep"
$PGREP -f "$PATTERN"
if [ $? -ne 0 ]
then
   $SERVICE $0 start
fi
