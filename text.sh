sudo touch /etc/nginx/conf.d/jenkins.conf
tee -a /etc/nginx/conf.d/jenkins.conf<< END
server {
  listen 80;
  listen [::]:80;

  server_name awsservice.me;

  location / {
      proxy_pass http://localhost:8080/;
  }
}
END
sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
sudo nginx -t
sudo nginx -s reload