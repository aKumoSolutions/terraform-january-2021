#!/bin/bash
yum install httpd -y
echo "db details for ${env} env\naddress = ${address}\nusername=${username}" >> /var/www/html/index.html
systemctl start httpd