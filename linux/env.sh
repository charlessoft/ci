echo export JAVA_HOME=/usr/local/jdk >> /etc/profile
echo export JAVA_BIN=$JAVA_HOME/bin >> /etc/profile
echo export M2_HOME=/usr/local/apache-maven >> /etc/profile
echo export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin >> /etc/profile
echo export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar >> /etc/profile
echo export JAVA_HOME JAVA_BIN PATH CLASSPATH >> /etc/profile
su - root -c 'source /etc/profile'

