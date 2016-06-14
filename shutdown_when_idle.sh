#!/bin/bash

# Shutdown jenkins slave when slave go to offline due idle
# For AWS waiting for end of the billing hour (i.e. minutes of uptime)
# Run this script every minutes via cron

PATTERN='java -jar slave.jar'
PGREP="/usr/bin/pgrep"

minutes=$(uptime -p | awk '{print  $(NF-1)}')
echo $minutes

if [[ "$minutes" -gt 56 ]];
then
    $PGREP -f "$PATTERN"
    # if not running
    if [[ $? -ne 0 ]]
    then
       echo 'we are going to shutdown'
       sudo shutdown -h now
    fi
fi

