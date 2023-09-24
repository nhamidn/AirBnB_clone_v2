#!/usr/bin/env bash
#Script that setup web servers for the deployment of web_static

apt-get update
apt-get -y install nginx
mkdir -p /data/web_static/releases/test/
mkdir /data/web_static/shared/
echo '<html><head></head><body><h2>MoroccanTechLoom</h2></body></html>' > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -hR ubuntu:ubuntu /data/
sed -i '51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default
service nginx restart
