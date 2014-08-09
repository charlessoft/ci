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
JMETER_SRC=apache-jmeter-2.11
SONARQUBE_SOURCE=sonarqube-4.4
SONAR_RUNNER_DIST_SOURCE=sonar-runner-dist-2.4
SONAR_RUNNER_SOURCE=sonar-runner-2.4
SOFTS_SRC=/softs
env: 
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

jmeter:
	tar zxvf ${SOFTS_SRC}/${JMETER_SRC}.tgz -C ${INSTALL_ROOT}
	ln -s ${INSTALL_ROOT}/${JMETER_SRC} ${INSTALL_ROOT}/jmeter

sonar:
	unzip ${SOFT_FOLDER}/${SONARQUBE_SOURCE}.zip -d ${INSTALL_ROOT}
	unzip ${SOFT_FOLDER}/${SONAR_RUNNER_DIST_SOURCE}.zip -d ${INSTALL_ROOT}
	ln -s ${INSTALL_ROOT}/${SONARQUBE_SOURCE} ${INSTALL_ROOT}/sonarqube
	ln -s ${INSTALL_ROOT}/${SONAR_RUNNER_SOURCE} ${INSTALL_ROOT}/sonar_runner

mysql:
	tar zxvf ${SOFTS_SRC}/${MYSQL_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
		cmake .
	cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
		make && make install
	chown -R mysql.mysql ${INSTALL_ROOT}/${MYSQL_SRC}
	chmod +x ${INSTALL_ROOT}/${MYSQL_SRC}/scripts/mysql_install_db
	cd ${INSTALL_ROOT}/${MYSQL_SRC}/scripts && \
		./mysql_install_db --user=mysql --basedir=${INSTALL_ROOT}/mysql --datadir=${INSTALL_ROOT}/mysql/data 
	cd ${INSTALL_ROOT}/${MYSQL_SRC}/support-files && \
		cp mysql.server /etc/rc.d/init.d/mysql && \
		cp my-default.cnf /etc/my.cnf 
	chmod +x /etc/rc.d/init.d/mysql 
	chkconfig --add mysql
	chkconfig mysql on
	service mysql start

libxml2:
	tar zxvf ${SOFTS_SRC}/${LIBXML_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${LIBXML_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/libxml2
	cd ${INSTALL_ROOT}/${LIBXML_SRC} && \
		make && make install 

php_curl_module:
	cd ${INSTALL_ROOT}/${PHP_SRC}/ext/curl && \
		./phpize && \
		./configure --with-curl=/libs/curl && \
		make
	#复制生成的curl.so文件到php5的extension配置目录,修改php.ini 
	#php5的配置目录路径 /usr/local/php5/lib/php/extensions/no-debug-non-zts-20121212
	#修改php.ini 增加 extension=curl.so
	#php.ini的目录, 源码安装的话.需要拷贝源码中的php.ini-production 到/usr/local/php/lib/php.ini
php: 
	tar zxvf ${SOFTS_SRC}/${PHP_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/php5 \
		--with-mysql=${INSTALL_ROOT}/mysql \
		--with-apxs2=${INSTALL_ROOT}/apache/bin/apxs \
		--with-libxml-dir=${INSTALL_ROOT}/libxml2 
		#--with-gd \
		#--with-zlib \
		#--with-curl \
		#--with-ldap \
		#--with-gettext \
		#--with-iconv \
		#--enable-mbstring \
		#--enable-soap \
		#--with-xmlrpc \
		#--with-jpeg-dir=${INSTALL_ROOT}/jpeg6 \
		#--with-png-dir=/usr/local/libpng2 \
		#--with-freetype-dir=/usr/local/freetype \
		#--with-config-file-path=/usr/local/php5/etc
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		make && make install
	cp ${INSTALL_ROOT}/${PHP_SRC}/php.ini-production  ${INSTALL_ROOT}/php5/lib/php.ini

#下载地址:
#nginx-1.7.2 
#http://nginx.org/download/nginx-1.7.2.tar.gz

#apache
#http://apache.fayea.com/apache-mirror//httpd/httpd-2.4.10.tar.gz
users:
	chmod +x UserMgr/CreateUser.sh 
	sh UserMgr/CreateUser.sh 
