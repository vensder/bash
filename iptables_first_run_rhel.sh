#!/bin/bash

# For CentOS 6
# backup running iptables rules
/sbin/service iptables save > /etc/sysconfig/iptables.backup."$(date +%s)"

# if you don't have /etc/sysconfig/iptables
iptables -P INPUT ACCEPT
iptables -F
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -L -v

/sbin/service iptables save

/sbin/service iptables restart
