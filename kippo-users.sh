#!/bin/bash

# make user db with login and pass from kippo logs

docker logs kippo \
| grep 'login attempt' \
| grep failed \
| awk '{print $9}' \
| sort | uniq \
| sed 's/\//:0:/' | sed 's/\[//' | sed 's/\]//' >userdb.txt


