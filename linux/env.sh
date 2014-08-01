#!/bin/sh 
JAVA_HOME=/usr/local/jdk 
JAVA_BIN=$JAVA_HOME/bin 
M2_HOME=/usr/local/apache-maven 
SVN_HOME=/usr/local/svn
PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$SVN_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 
echo JAVA_HOME=$JAVA_HOME 
echo JAVA_BIN=$JAVA_BIN 
echo PATH=$PATH 
echo CLASSPATH=$CLASSPATH 

echo export JAVA_HOME=$JAVA_HOME >> /etc/profile
echo export JAVA_BIN=$JAVA_HOME/bin >> /etc/profile
echo export M2_HOME=/usr/local/apache-maven >> /etc/profile
echo export SVN_HOME=/usr/local/svn >> /etc/profile
echo export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$SVN_HOME/bin >> /etc/profile
echo export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar >> /etc/profile
echo export JAVA_HOME JAVA_BIN PATH CLASSPATH >> /etc/profile
su - root -c 'source /etc/profile'

