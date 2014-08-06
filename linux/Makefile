INSTALL_ROOT=/usr/local
TOMCAT_SRC=apache-tomcat-7.0.52
JDK_FILE=jdk-6u38-ea-bin-b04-linux-i586-31_oct_2012.bin
JDK_SRC=jdk1.6.0_38
MAVEN_SRC=apache-maven-3.2.1
JENKINS_SRC=jenkins
APR_SRC=apr-1.3.6
APRUTIL_SRC=apr-util-1.3.8
APACHEHTTP_SRC=httpd-2.2.9
SUBVERSION_SRC=subversion-1.8.5
SQLITE_AMALGAMATION_SRC=sqlite-amalgamation-3080301
SOFTS_SRC=../softs
init: users
	chmod +x env.sh
	sh env.sh
jdk:
	test -d ${INSTALL_ROOT} || mkdir ${INSTALL_ROOT}
	cd ${SOFTS_SRC}; cp ${SOFTS_SRC}/${JDK_FILE} ${INSTALL_ROOT}
	chmod +x ${INSTALL_ROOT}/${JDK_FILE}
	cd ${INSTALL_ROOT} && ./${JDK_FILE}
	cd ${INSTALL_ROOT}; ln -s ${JDK_SRC} ${INSTALL_ROOT}/jdk

#如何写入到 /etc/profile中
#echo "export JAVA_HOME=/usr/local/jdk1.6.0_38" >> /etc/profile
#echo "export JAVA_BIN=/usr/local/jdk1.6.0_38/bin" >> /etc/profile
#echo "export M2_HOME=/usr/local/apache-maven" >> /etc/profile
#echo "export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin" >> /etc/profile
#echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile
#echo "export JAVA_HOME JAVA_BIN PATH CLASSPATH" >> /etc/profile

apr:
	tar zxvf ${SOFTS_SRC}/${APR_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${APR_SRC} && \
		./configure --prefix=/usr/local/apr-httpd && \
		make && \
		make install 
aprutil:
	tar zxvf ${SOFTS_SRC}/${APRUTIL_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${APRUTIL_SRC} && \
		./configure --prefix=/usr/local/apr-util-httpd --with-apr=/usr/local/apr-httpd/ && \
		make && \
		make install
apache: apr aprutil
	tar zxvf ${SOFTS_SRC}/${APACHEHTTP_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${APACHEHTTP_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/apache \
		--enable-dav \
		--enable-so \
		--enable-maintainer-mode \
		--with-apr=${INSTALL_ROOT}/apr-httpd/ \
		--with-apr-util=${INSTALL_ROOT}/apr-util-httpd/ \
		--with-included-apr && \
		make && \
		make install

subversion: 
	#apt-get install zlib1g-dev 
	tar zxvf ${SOFTS_SRC}/${SUBVERSION_SRC}.tar.gz -C ${INSTALL_ROOT}
	unzip ${SOFTS_SRC}/${SQLITE_AMALGAMATION_SRC}.zip -x -d ${INSTALL_ROOT}/${SUBVERSION_SRC}
	cd ${INSTALL_ROOT}/${SUBVERSION_SRC} && \
		mv ./${SQLITE_AMALGAMATION_SRC} ${INSTALL_ROOT}/${SUBVERSION_SRC}/sqlite-amalgamation  && \
		./configure --prefix=/usr/local/svn --with-apr=/usr/local/apr-httpd --with-apr-util=/usr/local/apr-util-httpd  && \
		make && \
		make install
		#./configure --prefix=/opt/svn --with-apxs=/usr/local/apache2.2.9/bin/apxs --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr
maven:
	cd ${SOFTS_SRC} && \
		tar zxvf ${MAVEN_SRC}-bin.tar.gz -C ${INSTALL_ROOT}
	test -d ${INSTALL_ROOT}/apache-maven ||  ln -s ${INSTALL_ROOT}/${MAVEN_SRC} ${INSTALL_ROOT}/apache-maven 

tomcat:
	cd ${SOFTS_SRC} && \
		tar zxvf ${TOMCAT_SRC}.tar.gz -C ${INSTALL_ROOT}
	test -d ${INSTALL_ROOT}/apache-tomcat || ln -s ${INSTALL_ROOT}/${TOMCAT_SRC} ${INSTALL_ROOT}/apache-tomcat
	#### 修改配置脚本--改成UTF-8 
	cd ${INSTALL_ROOT}/apache-tomcat && \
		cp conf/server.xml conf/server.xml_bak  && \
		sed -i "72s/\/>//" conf/server.xml && \
		sed -i "73 i\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ URIEncoding=\"UTF-8\" \/>" conf/server.xml && \
		sed -i "97 i JAVA_OPTS=\"-XX:PermSize=64M -XX:MaxPermSize=128m -Xms512m -Xmx1048m -Duser.timezone=Asia/Shanghai  -Djava.awt.headless=true\"" bin/catalina.sh

#./startup.sh
buildData:
	wget https://github.com/charlessoft/ci_softs/archive/master.zip -O ../master.zip 
	cd ../ && \
		unzip master.zip -d ${SOFTS_SRC} 
	cd ../ && \
		mv ${SOFTS_SRC}/ci_softs-master/*.* ${SOFTS_SRC}

jenkins:
	cd ${SOFTS_SRC} && \
		cp ${JENKINS_SRC}.war ${INSTALL_ROOT}/apache-tomcat/webapps

#install_master: maven tomcat jenkins
install_master: tomcat jenkins
#install_master: maven tomcat jenkins
	echo "install master"

install_slave: jdk maven
	#链接slave,jenkins会看jdk路径在哪里,
	#默认的搜索路径是/usr/bin/java 所以可能需要在slave中设置链接就好
	#cygwin:
	ln -s /cygdrive/c/Program\ Files\ \(x86\)/Java/jdk1.6.0_38/bin/java.exe /usr/bin/java

	#echo "install slave"

users:
	chmod +x UserMgr/CreateUser.sh 
	sh UserMgr/CreateUser.sh 
