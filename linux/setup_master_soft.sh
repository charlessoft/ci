#echo "export JAVA_HOME=/usr/local/java/jdk1.6.0_38" >> /etc/profile
#echo "export JAVA_BIN=/usr/local/java/jdk1.6.0_38/bin" >> /etc/profile
#echo "export M2_HOME=/usr/local/java/apache-maven" >> /etc/profile
#echo "export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin" >> /etc/profile
#echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile
#echo "export JAVA_HOME JAVA_BIN PATH CLASSPATH" >> /etc/profile


#maven
#cp apache-maven-3.2.1-bin.zip /usr/local/java
#cd /usr/local/java
#unzip apache-maven-3.2.1-bin.zip
#ln -s apache-maven-3.2.1 apache-maven


#tomcat
cp apache-tomcat-7.0.52.tar.gz /usr/local/java
cd /usr/local/java
tar zxvf apache-tomcat-7.0.52.tar.gz
ln -s apache-tomcat-7.0.52 apache-tomcat
cd apache-tomcat/bin
#./startup.sh
