#!/bin/sh 
JAVA_HOME=/usr/local/jdk 
JAVA_BIN=$JAVA_HOME/bin 
M2_HOME=/usr/local/apache-maven 
SVN_HOME=/usr/local/svn
JMETER_HOME=/usr/local/jmeter
SONAR_RUNNER_HOME=/usr/local/sonar_runner
PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$SVN_HOME/bin:$JMETER_HOME/bin:$SONAR_RUNNER_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 
echo JAVA_HOME=$JAVA_HOME 
echo JAVA_BIN=$JAVA_BIN 
echo PATH=$PATH 
echo CLASSPATH=$CLASSPATH 
echo JMETER_HOME=$JMETER_HOME

echo export JAVA_HOME=$JAVA_HOME >> /etc/profile
echo export JAVA_BIN=$JAVA_HOME/bin >> /etc/profile
echo export M2_HOME=/usr/local/apache-maven >> /etc/profile
echo export SVN_HOME=/usr/local/svn >> /etc/profile
echo export JMETER_HOME=/usr/local/jmeter >> /etc/profile
echo export SONAR_RUNNER_HOME=$SONAR_RUNNER_HOME >> /etc/profile 
echo export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$SVN_HOME/bin:$JMETER_HOME/bin:$SONAR_HOME/bin:$SONAR_RUNNER_HOME/bin >> /etc/profile

echo export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar >> /etc/profile
echo export JAVA_HOME JAVA_BIN PATH CLASSPATH >> /etc/profile
su - root -c 'source /etc/profile'

