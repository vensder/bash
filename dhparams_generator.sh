#!/bin/bash

mkdir -p /etc/ssl/private
chmod 710 /etc/ssl/private

cd /etc/ssl/private
openssl dhparam -out dhparams.pem 2048
chmod 600 dhparams.pem

