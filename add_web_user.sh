#!/bin/bash

# add_web_user.sh

if [[ $# -ne 1 ]]; then
   echo "usage: ./$0 <username>"
   echo "where <username> has a domain name format (ex.: example.com)"
   exit 1
fi

user=$1
useradd -d /var/www/$user $user
usermod -a -G $user nginx


mkdir -p /var/www/$user/public_html
chown -R $user:$user /var/www/$user/public_html
chmod 755 /var/www/$user

mkdir -p /var/lib/php/session/$user
chown -R $user:$user /var/lib/php/session/$user

echo "server {

	listen 80;
	server_name $user www.$user;
	access_log /var/www/$user/nginx_access.log;
	error_log /var/www/$user/nginx_error.log;

	location ~* \.(jpg|jpeg|gif|png|css|zip|tgz|gz|rar|bz2|doc|xls|exe|pdf|ppt|tar|wav|bmp|rtf|swf|ico|flv|txt|docx|xlsx)$ {
		root /var/www/$user/public_html/;
		index index.html index.php;
		access_log off;
		expires 30d;
	}

	location ~ /\.ht {
		deny all;
	}

	location / {
		proxy_pass http://127.0.0.1:8080/;
		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-for \$remote_addr;
		proxy_set_header Host \$host;
		proxy_connect_timeout 60;
		proxy_send_timeout 90;
		proxy_read_timeout 90;
		proxy_redirect off;
		proxy_set_header Connection close;
		proxy_pass_header Content-Type;
		proxy_pass_header Content-Disposition;
		proxy_pass_header Content-Length;
	}
}" > /etc/nginx/conf.d/$user.conf

echo "<VirtualHost *:8080>
<Directory /var/www/$user/public_html>
    Options FollowSymLinks
    AllowOverride All
    RewriteEngine On
    Order Allow,Deny
    Allow from all
</Directory>
    ServerAdmin webmaster@$user
    DocumentRoot /var/www/$user/public_html
    php_admin_value open_basedir /var/www/$user/public_html/
    ServerAlias $user
    ServerName www.$user
    ErrorLog /var/www/$user/error.log
    CustomLog /var/www/$user/access.log common
<IfModule itk.c>
    php_admin_value session.save_path \"/var/lib/php/session/$user\"
    AssignUserId $user $user
</IfModule>
</VirtualHost>" > /etc/httpd/conf.d/$user.conf

service httpd restart
service nginx restart

