#!/bin/bash

# Self signed certificate

openssl req \
   -newkey rsa:2048 -nodes -keyout domain.key \
   -out domain.csr \
   -subj "/C=US/ST=New York/L=New York/O=OrgName/CN=example.comain.com"

openssl x509 \
   -signkey domain.key \
   -in domain.csr \
   -req -days 3650 -out domain.crt

