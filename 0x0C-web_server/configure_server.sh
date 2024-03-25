#!/usr/bin/env bash

pt-get update
apt-get upgrade -y
apt-get install -y nginx
mkdir -p /etc/nginx/sites-enabled
sed -i 's/80/8080/g' /etc/nginx/sites-enabled/default
service nginx restart
