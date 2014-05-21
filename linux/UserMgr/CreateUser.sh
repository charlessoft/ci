#!/bin/bash
path=$(dirname $0)

echo path=$(pwd)/$path
#当前目录保存到变量D中
#D=$(pwd)
#根据当前目录得到上级目录
#P=$(dirname $D)

newusers $path/userlist.txt
chpasswd < $path/userpasswd.txt

#sudo chmod 4755 /usr/local 
# 创建ci组
sudo groupadd ci
sudo chown root:ci /usr/local 
sudo chmod 755 /usr/local 
sudo chown jenkins:ci /usr/local 


