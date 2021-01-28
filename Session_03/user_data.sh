#!/bin/bash
yum install httpd -y
echo "Hello from EC2 of ${env} environment" >> /var/www/html/index.html
systemctl start httpd