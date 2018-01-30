#!/usr/bin/env bash

if [ "$1" = "" ]; then
	echo "Pass domain name as parameter"
	exit 1
fi

DOMAIN_NAME="$1"

openssl req -newkey rsa:2048 -nodes -keyout $DOMAIN_NAME.key \
	        -x509 -days 3650 -out $DOMAIN_NAME.crt \
		-subj "/C=US/ST=New York/L=Brooklyn/O=Example Brooklyn Company/CN=$DOMAIN_NAME.com"

