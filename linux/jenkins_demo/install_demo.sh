#!/bin/bash 
path=$(dirname $0)
curPath=$(pwd)/$path
echo curPath=$curPath
mkdir -p ~/submd/repos/
cd ~/submd/repos/ 
git --git-dir=project1.git init --bare
echo $curPath
git clone jenkins@10.211.55.6:/home/jenkins/submd/repos/project1.git  ~/submd/ws 
cp $curPath/Makefile ~/submd/ws 
cp $curPath/main.c ~/submd/ws 
cd ~/submd/ws/ 
git add .
git commit -m "init"
git push origin master

