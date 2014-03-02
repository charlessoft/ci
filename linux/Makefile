INSTALL_ROOT=/usr/local/java
TOMCAT_SRC=apache-tomcat-7.0.52
JDK_SRC=jdk-6u38-ea-bin-b04-linux-i586-31_oct_2012.bin
MAVEN_SRC=apache-maven-3.2.1
JENKINS_SRC=jenkins
#jdk
jdk:
	test -d ${INSTALL_ROOT} || mkdir ${INSTALL_ROOT}
	cp ./${JDK_SRC} ${INSTALL_ROOT}
	chmod +x ${INSTALL_ROOT}/${JDK_SRC}
	cd ${INSTALL_ROOT} && ./${JDK_SRC}

#echo "export JAVA_HOME=/usr/local/java/jdk1.6.0_38" >> /etc/profile
#echo "export JAVA_BIN=/usr/local/java/jdk1.6.0_38/bin" >> /etc/profile
#echo "export M2_HOME=/usr/local/java/apache-maven" >> /etc/profile
#echo "export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin" >> /etc/profile
#echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile
#echo "export JAVA_HOME JAVA_BIN PATH CLASSPATH" >> /etc/profile

maven:
	tar zxvf ${MAVEN_SRC}-bin.tar.gz -C ${INSTALL_ROOT}
	test -d ${INSTALL_ROOT}/apache-maven ||  ln -s ${INSTALL_ROOT}/${MAVEN_SRC} ${INSTALL_ROOT}/apache-maven 

tomcat:
	tar zxvf ${TOMCAT_SRC}.tar.gz -C ${INSTALL_ROOT}
	test -d ${INSTALL_ROOT}/apache-tomcat || ln -s ${INSTALL_ROOT}/${TOMCAT_SRC} ${INSTALL_ROOT}/apache-tomcat
	#### 修改配置脚本--改成UTF-8 
	cd ${INSTALL_ROOT}/apache-tomcat && \
		cp conf/server.xml conf/server.xml_bak  && \
		sed -i "72s/\/>//" conf/server.xml && \
		sed -i "73 i\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ URIEncoding=\"UTF-8\" \/>" conf/server.xml

#./startup.sh

jenkins:
	cp ${JENKINS_SRC}.war ${INSTALL_ROOT}/apache-tomcat/webapps

install_master: $(maven),$(tomcat)
	echo "install master"

