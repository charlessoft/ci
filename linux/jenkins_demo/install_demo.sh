#!/bin/bash 
#使用jenkins用户进行操作

CURUSER=$USER
if [ $CURUSER != "jenkins" ] ; then     #如果不是jenkins用户就退出
    echo "user="$CURUSER 
    echo "please use jenkins account"
    exit -1
fi     #ifend

path=$(dirname $0)
curPath=$(pwd)/$path
echo curPath=$curPath
mkdir -p ~/submd/repos/
cd ~/submd/repos/ 
git --git-dir=project1.git init --bare
echo $curPath
git clone jenkins@localhost:/home/jenkins/submd/repos/project1.git  ~/submd/ws 
cp $curPath/Makefile ~/submd/ws 
cp $curPath/main.c ~/submd/ws 
cd ~/submd/ws/ 
git add .
git commit -m "init"
git push origin master

