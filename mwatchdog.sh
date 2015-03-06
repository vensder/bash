#!/bin/sh
#PATTERN='/opt/bin/security-manager -d --config=/etc/security_manager/main.cfg'
# PATTERN='/opt/bin/security-manager -d'
PATTERN='/usr/sbin/snmpd -LS0-6d -Lf'
# MYPROG="security_manager"
MYPROG="snmpd"
SERVICE="/sbin/service"
PGREP="/usr/bin/pgrep"
# find myprog pid
#$PGREP ${PATTERN}
$PGREP -f "$PATTERN"
# if not running
if [ $? -ne 0 ]
then
   $SERVICE $MYPROG start
fi



