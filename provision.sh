#!/usr/bin/env bash
sudo yum install nginx -y
sudo service nginx start
echo '<html><head><title>Blue Team Server</title></head><body style="background-color:#1F778D"><p style="text-align: center;"><span style="color:#FFFFFF;"><span style="font-size:28px;">Blue Team</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html