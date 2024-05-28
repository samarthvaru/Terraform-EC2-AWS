#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/samarthvaru/Portfolio/archive/refs/heads/main.zip
unzip main.zip
cp -r Portfolio-main/* /var/www/html/
rm -rf Portfolio-main main.zip
systemctl enable httpd 
systemctl start httpd