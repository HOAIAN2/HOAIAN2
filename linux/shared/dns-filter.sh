#!/bin/bash

# Replace default dns by a dns that support ads block

DNS_SERVICE=dns.adguard-dns.com

DNS_FILTER_IP=$(ping $DNS_SERVICE -4 -c 1 | grep "$DNS_SERVICE" | head -1 | awk '{print $3}' | sed 's/[()]//g')

sudo sed -i -e "s/nameserver 127.0.0.53/# nameserver 127.0.0.53\nnameserver $DNS_FILTER_IP/g" /etc/resolv.conf
