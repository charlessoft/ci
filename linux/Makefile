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
ICONV_SRC=libiconv-1.14
LIBMCRYPT_SRC=libmcrypt-2.5.8
MCRYPT_SRC=mcrypt-2.6.8
MHASH_SRC=mhash-0.9.9.9
MYSQL_SRC=mysql-5.6.20
LIBXML_SRC=libxml2-2.7.2
PHP_SRC=php-5.5.15
MEMCACHE_SRC=memcache-2.2.7
SOFTS_SRC=/softs

mcrypt:
	tar zxvf ${SOFTS_SRC}/${MCRYPT_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MCRYPT_SRC} && \
		/sbin/ldconfig && \
		./configure && make && make install
mhash:
	tar xvf ${SOFTS_SRC}/${MHASH_SRC}.tar.bz2 -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MHASH_SRC} && \
		./configure && make && make install

libmcrypt:
	tar zxvf ${SOFTS_SRC}/${LIBMCRYPT_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${LIBMCRYPT_SRC} && \
		./configure && make && make install
	/sbin/ldconfig
	cd ${INSTALL_ROOT}/${LIBMCRYPT_SRC}/libltdl && \
		./configure --enable-ltdl-install && \
		make && make install
	#64位系统
	ln -sf /usr/local/lib/libmcrypt.la /usr/lib64/libmcrypt.la
	ln -sf /usr/local/lib/libmcrypt.so /usr/lib64/libmcrypt.so
	ln -sf /usr/local/lib/libmcrypt.so.4 /usr/lib64/libmcrypt.so.4
	ln -sf /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib64/libmcrypt.so.4.4.8
	ln -sf /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config
	ln -sf /usr/local/lib/libiconv.so.2 /usr/lib64/libiconv.so.2
	ldconfig


##32位系统
#ln -sf /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
#ln -sf /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
#ln -sf /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
#ln -sf /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
#ln -sf /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config
#ln -sf /usr/local/lib/libiconv.so.2 /usr/lib/libiconv.so.2
#ldconfig

iconv:
	tar zxvf ${SOFTS_SRC}/${ICONV_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${ICONV_SRC} && \
		./configure && \
		make && make install
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
	#cp ${INSTALL_ROOT}/apache/conf/httpd.conf ${INSTALL_ROOT}/apache/conf/httpd.conf_bak
	#cp ./php/httpd.conf ${INSTALL_ROOT}/apache/conf/

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
	
php5: 
	cp -frp /usr/lib64/libldap* /usr/lib/
	tar zxvf ${SOFTS_SRC}/${PHP_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/php5 \
		--with-config-file-path=${INSTALL_ROOT}/php5/etc \
		--with-mysql=${INSTALL_ROOT}/mysql \
		--with-mysqli=${INSTALL_ROOT}/mysql/bin/mysql_config \
		--with-libxml-dir=${INSTALL_ROOT}/libxml2 \
		--with-apxs2=${INSTALL_ROOT}/apache/bin/apxs \
		--with-iconv-dir=/usr/local/lib64 \
		--enable-opcache=no \
		--with-freetype-dir \
		--with-jpeg-dir \
		--with-png-dir \
		--with-zlib \
		--enable-xml \
		--disable-rpath \
		--enable-safe-mode \
		--enable-bcmath \
		--enable-shmop \
		--enable-sysvsem \
		--enable-inline-optimization \
		--with-curl \
		--with-curlwrappers \
		--enable-mbregex \
		--enable-fpm \
		--enable-mbstring \
		--with-mcrypt \
		--with-gd \
		-enable-gd-native-ttf \
		--with-mhash \
		--enable-pcntl \
		--enable-sockets \
		--with-ldap \
		--with-ldap-sasl \
		--with-xmlrpc \
		--enable-zip \
		--enable-soap \
		--without-pear
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		make ZEND_EXTRA_LIBS='-liconv' && make install
	#cp ${INSTALL_ROOT}/${PHP_SRC}/php.ini-production  ${INSTALL_ROOT}/php5/lib/php.ini
	cp  ${PWD}/php/php.ini ${INSTALL_ROOT}/php5/lib/php.ini


memcache:
	tar zxvf ${SOFTS_SRC}/${MEMCACHE_SRC}.tgz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MEMCACHE_SRC} && \
		${INSTALL_ROOT}/php5/bin/phpize &&  \
		./configure --with-php-config=${INSTALL_ROOT}/php5/bin/php-config && \
		make && make install
#下载地址:
#nginx-1.7.2 
#http://nginx.org/download/nginx-1.7.2.tar.gz

#apache
#http://apache.fayea.com/apache-mirror//httpd/httpd-2.4.10.tar.gz

#iconv
#http://ftp.gnu.org/gnu/libiconv/libiconv-1.14.tar.gz

#libmcrypt
#http://www.51osos.com/uploads/soft/libmcrypt-2.5.8.tar.gz

#mcrypt
#http://nchc.dl.sourceforge.net/project/mcrypt/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz

#mhash
#http://ncu.dl.sourceforge.net/project/mhash/mhash/0.9.9.9/mhash-0.9.9.9.tar.bz2

#memcache
#http://pecl.php.net/get/memcache-2.2.7.tgz
users:
	chmod +x UserMgr/CreateUser.sh 
	sh UserMgr/CreateUser.sh 

