#!/bin/bash
sudo apt install ufw -y
sudo ufw app list
sudo ufw status
sudo ufw enable
sudo ufw allow OpenSSH
touch /etc/nginx/sites-available/csye6225jinshuang.me
sudo chmod 755 /etc/nginx/sites-available/csye6225jinshuang.me
echo "..." >> /etc/nginx/sites-available/csye6225jinshuang.me
echo "server_name csye6225jinshuang.me www.csye6225jinshuang.me;" >> /etc/nginx/sites-available/csye6225jinshuang.me
echo "..." >> /etc/nginx/sites-available/csye6225jinshuang.me
sudo nginx -t
sudo systemctl reload nginx
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw status
sudo certbot --nginx -d csye6225jinshuang.me -d www.csye6225jinshuang.me