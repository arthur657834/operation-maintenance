https://rocket.chat/docs/installation/manual-installation/centos/

[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc

yum install -y mongodb-org GraphicsMagick

npm install -g inherits n

systemctl start mongod 

export PORT=3000
export ROOT_URL=http://your-host-name.com-as-accessed-from-internet:3000/
export MONGO_URL=mongodb://localhost:27017/rocketchat

[Unit]
Description=The Rocket.Chat server
After=network.target remote-fs.target nss-lookup.target nginx.target mongod.target
[Service]
ExecStart=/usr/bin/node /opt/Rocket.Chat/main.js
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=rocketchat
User=root
Environment=MONGO_URL=mongodb://localhost:27017/rocketchat ROOT_URL=http://10.1.50.181:3000/ PORT=3000
[Install]
WantedBy=multi-user.target

systemctl enable rocketchat.service
systemctl start rocketchat.service
