#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo chkconfig httpd on
sudo ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime
