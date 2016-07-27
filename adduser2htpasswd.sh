#!/bin/bash

HTPASSWD='/etc/nginx/.htpasswd'
# adding new user with chifer pass
read -p "Enter name for new user: " NEW_USER
echo -n $NEW_USER: >> $HTPASSWD
openssl passwd -apr1 >> $HTPASSWD 

## Part of nginx config:

# location / {
#    autoindex on;
#    root  /web/root;
#    auth_basic "Restricted";
#    auth_basic_user_file /etc/nginx/.htpasswd;
# }

