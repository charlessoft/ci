LIBSPATH=/libs
ZLIB_FILE=zlib-1.2.8.tar.gz
ZLIB_FOLDER=zlib-1.2.8
ZLIB_PATH=${LIBSPATH}/zlib
ZLIB_CPPFLAGS=$(ZLIB_PATH)/include
ZLIB_LDFLAGS=$(ZLIB_PATH)/lib

GIT_FILE=git-1.7.8.tar.gz
GIT_FOLDER=git-1.7.8
GIT_PATH=${LIBSPATH}/git
GIT_CPPFLAGS=$(GIT_PATH)/include
GIT_LDFLAGS=$(GIT_PATH)/lib

OPENSSL_FILE=openssl-1.0.1c.tar.gz
OPENSSL_FOLDER=openssl-1.0.1c
OPENSSL_PATH=/libs/openssl
OPENSSL_CPPFLAGS=$(OPENSSL_PATH)/include
OPENSSL_CPPFLAGS_OPENSSL=$(OPENSSL_PATH)/include/openssl
OPENSSL_LDFLAGS=$(OPENSSL_PATH)/lib

CURL_FILE=curl-7.31.0.tar.bz2
CURL_FOLDER=curl-7.31.0
CURL_PATH=/libs/curl
CURL_CPPFLAGS=$(CURL_PATH)/include
CURL_LDFLAGS=$(CURL_PATH)/lib

SCONS_FILE=scons-2.3.0.zip
SCONS_FOLDER=scons-2.3.0
export MYSCONS=$(PWD)/$(SCONS_FOLDER)
export SCONS_LIB_DIR=$(MYSCONS)/engine

JSONCPP_FILE=jsoncpp-src-0.5.0.tar.gz
JSONCPP_FOLDER=jsoncpp-src-0.5.0
JSONCPP_PATH=/libs/jsoncpp
JSONCPP_CPPFLAGS=$(JSONCPP_PATH)/include
JSONCPP_LDFLAGS=$(JSONCPP_PATH)

LOG4CPLUS_FILE=log4cplus-1.1.2-rc2.tar.bz2
LOG4CPLUS_FOLDER=log4cplus-1.1.2-rc2
LOG4CPLUS_PATH=/libs/log4cplus
LOG4CPLUS_CPPFLAGS=$(LOG4CPLUS_PATH)/include
LOG4CPLUS_LDFLAGS=$(LOG4CPLUS_PATH)/lib
INSTALL_ROOT=/usr/local
TOMCAT_SRC=apache-tomcat-7.0.52
JDK_FILE=jdk-6u38-ea-bin-b04-linux-i586-31_oct_2012.bin
JDK_X64_FILE=jdk-6u38-ea-bin-b04-linux-amd64-31_oct_2012-rpm.bin
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
MYSQL_NAME=mysql
MYSQL_DATA_PATH=/home/www/data
LIBXML_SRC=libxml2-2.7.2
PHP_SRC=php-5.5.15
MEMCACHE_SRC=memcache-2.2.7

PYTHON_SRC=Python-2.7.8

NGINX_SRC=nginx-1.7.4
EGINX_SRC=eginx-1.7.4
export OSTYPE="`uname -s`"

ZLIB_SRC=zlib-1.2.8
PCRE_SRC=pcre-8.33
OPENSSL_SRC=openssl-1.0.1c

NGX_DEPS=--with-openssl=../openssl \
		 --with-pcre=../pcre \
		 --with-zlib=../zlib \

NGX_MODULES=--with-http_ssl_module 
SOFTS_SRC=/softs

python278:
	tar zxvf ${SOFTS_SRC}/${PYTHON_SRC}.tgz -C ${SOFTS_SRC}
	mkdir /usr/local/python27 -p
	cd ${SOFTS_SRC}/${PYTHON_SRC} && \
		./configure --prefix=/usr/local/python27 && \
		make && make install 
	mv /usr/bin/python /usr/bin/python_old
	ln -s /usr/local/python27/bin/python2.7 /usr/bin/python

nginx:
	groupadd nginx 
	useradd -g nginx nginx -M -s/sbin/nologin
	mkdir -p /home/www/logs/nginx
	ln -sf ${OPENSSL_FOLDER} openssl
	ln -sf ${ZLIB_SRC} zlib
	ln -sf ${PCRE_SRC} pcre
	tar zxvf ${SOFTS_SRC}/${ZLIB_SRC}.tar.gz
	tar zxvf ${SOFTS_SRC}/${PCRE_SRC}.tar.gz
	tar zxvf ${SOFTS_SRC}/${OPENSSL_FOLDER}.tar.gz
	tar zxvf ${SOFTS_SRC}/${NGINX_SRC}.tar.gz
	cd ${NGINX_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/nginx \
		--with-cc-opt=" " \
		${NGX_MODULES} \
		${NGX_DEPS}
	cd ${NGINX_SRC} && \
		make && make install
	cp ${PWD}/nginx_conf/nginx.conf ${INSTALL_ROOT}/nginx/conf 
	cp ${PWD}/nginx_conf/bin ${INSTALL_ROOT}/nginx/ -R

mcrypt:
	tar zxvf ${SOFTS_SRC}/${MCRYPT_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MCRYPT_SRC} && \
		/sbin/ldconfig && \
		./configure && make && make install
mhash:
	tar xvf ${SOFTS_SRC}/${MHASH_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MHASH_SRC} && \
		./configure && make && make install
	#64位系统使用
	ln -sf /usr/local/lib/libmhash.a /usr/lib64/libmhash.a
	ln -sf /usr/local/lib/libmhash.la /usr/lib64/libmhash.la
	ln -sf /usr/local/lib/libmhash.so /usr/lib64/libmhash.so
	ln -sf /usr/local/lib/libmhash.so.2 /usr/lib64/libmhash.so.2
	ln -sf /usr/local/lib/libmhash.so.2.0.1 /usr/lib64/libmhash.so.2.0.1
	ldconfig

	##32位系统使用
	#ln -sf /usr/local/lib/libmhash.a /usr/lib/libmhash.a
	#ln -sf /usr/local/lib/libmhash.la /usr/lib/libmhash.la
	#ln -sf /usr/local/lib/libmhash.so /usr/lib/libmhash.so
	#ln -sf /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
	#ln -sf /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1
	#ldconfig

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


jdk64:
	test -d ${INSTALL_ROOT} || mkdir ${INSTALL_ROOT}
	cd ${SOFTS_SRC}; cp ${SOFTS_SRC}/${JDK_X64_FILE} ${INSTALL_ROOT}
	chmod +x ${INSTALL_ROOT}/${JDK_X64_FILE}
	cd ${INSTALL_ROOT} && ./${JDK_X64_FILE}
	cd ${INSTALL_ROOT}; ln -s ${JDK_SRC} ${INSTALL_ROOT}/jdk
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
	unzip -o ${SOFTS_SRC}/${SONARQUBE_SOURCE}.zip -d ${INSTALL_ROOT}
	unzip -o ${SOFTS_SRC}/${SONAR_RUNNER_DIST_SOURCE}.zip -d ${INSTALL_ROOT}
	ln -fs ${INSTALL_ROOT}/${SONARQUBE_SOURCE} ${INSTALL_ROOT}/sonarqube
	ln -fs ${INSTALL_ROOT}/${SONAR_RUNNER_SOURCE} ${INSTALL_ROOT}/sonar_runner
	cp ${PWD}/sonar_demo/sonar.properties ${INSTALL_ROOT}/sonarqube/conf/
	cp ${PWD}/sonar_demo/sonar-runner.properties ${INSTALL_ROOT}/sonar_runner/conf/


mysql:
	groupadd mysql
	useradd -g mysql mysql -M -s/sbin/nologin
	echo "${INSTALL_ROOT}/mysql/lib/" >> /etc/ld.so.conf
	ldconfig
	tar zxvf ${SOFTS_SRC}/${MYSQL_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
		cmake .
	cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
		make && make install
	chown -R mysql.mysql ${INSTALL_ROOT}/${MYSQL_SRC}
	chmod +x ${INSTALL_ROOT}/${MYSQL_SRC}/scripts/mysql_install_db
	cd ${INSTALL_ROOT}/${MYSQL_SRC}/scripts && \
		./mysql_install_db \
		--user=mysql \
		--basedir=${INSTALL_ROOT}/mysql \
		--datadir=${INSTALL_ROOT}/mysql/data 
	cd ${INSTALL_ROOT}/${MYSQL_SRC}/support-files && \
		cp mysql.server /etc/init.d/mysql && \
		cp my-default.cnf /etc/my.cnf 
	chmod +x /etc/init.d/mysql 
	chkconfig --add mysql
	chkconfig mysql on
	service mysql start

mysql_nginx:
	#groupadd mysql
	#useradd -g mysql mysql -M -s/sbin/nologin
	mkdir -p ${MYSQL_DATA_PATH}/mysql
	mkdir -p /home/www/logs/mysql 
	chown -R mysql:mysql /home/www/logs/mysql
	#tar zxvf ${SOFTS_SRC}/${MYSQL_SRC}.tar.gz -C ${INSTALL_ROOT}
	#cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
	#cmake . -DCMAKE_INSTALL_PREFIX=${INSTALL_ROOT}/mysql/ \
	#-DMYSQL_DATADIR=${MYSQL_DATA_PATH}/mysql \
	#-DMYSQL_UNIX_ADDR=${MYSQL_DATA_PATH}/mysql/mysqld.sock \
	#-DWITH_INNOBASE_STORAGE_ENGINE=1 \
	#-DWITH_MYISAM_STORAGE_ENGINE=1 \
	#-DENABLED_LOCAL_INFILE=1 \
	#-DMYSQL_TCP_PORT=3306 \
	#-DWITH_EXTRA_CHARSETS:STRING=utf8,gbk \
	#-DDEFAULT_CHARSET=utf8 \
	#-DDEFAULT_COLLATION=utf8_general_ci \
	#-DWITH_DEBUG=0 \
	#-DWITH_READLINE=1 \
	#-DWITH_SSL=yes \
	#-DSYSCONFDIR=${MYSQL_DATA_PATH}/mysql
	#cd ${INSTALL_ROOT}/${MYSQL_SRC} && \
		#make && make install
	chmod +w ${INSTALL_ROOT}/mysql
	chown -R mysql.mysql ${INSTALL_ROOT}/mysql
	chmod +x ${INSTALL_ROOT}/${MYSQL_SRC}/scripts/mysql_install_db
	cd ${INSTALL_ROOT}/mysql/scripts && \
		./mysql_install_db \
		--user=mysql \
		--basedir=${INSTALL_ROOT}/mysql \
		--datadir=${MYSQL_DATA_PATH}/mysql/data &
	#cd ${INSTALL_ROOT}/mysql/support-files && \
		#cp mysql.server /etc/init.d/mysqld && \
		#cp my-default.cnf ${MYSQL_DATA_PATH}/mysql/my.cnf 
	#chmod +x /etc/init.d/mysqld
	#mkdir /home/www/logs/mysql -p
	#chmod +w /home/www/logs/mysql
	#chown -R mysql:mysql /home/www/logs/mysql
	##chkconfig --add mysql
	##chkconfig mysql on
	##service mysql start
	#sed -i "8 ibasedir = /usr/local/mysql" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 idatadir = /home/www/data/mysql" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 ilog-error = /home/www/logs/mysql_error.log" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 ipid-file = /home/www/data/mysql/mysql.pid" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 irelay-log-index = /home/www/logs/mysql/relay.log" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 irelay-log-info-file = /home/www/logs/mysql/relay.log" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#sed -i "8 irelay-log = /home/www/logs/mysql/relay.log" ${MYSQL_DATA_PATH}/mysql/my.cnf
	##sed -i "8 ilog-slow-queries = /home/www/logs/mysql/slow.log" ${MYSQL_DATA_PATH}/mysql/my.cnf
	#/etc/init.d/mysqld start

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
php5_apache:
	tar zxvf ${SOFTS_SRC}/${PHP_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/php5 \
		--with-mysql=${INSTALL_ROOT}/mysql \
		--with-apxs2=${INSTALL_ROOT}/apache/bin/apxs \
		--with-libxml-dir=${INSTALL_ROOT}/libxml2 
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		make && make install 

php5_nginx: 
	ln -fs /usr/lib64/libjpeg.so /usr/lib/libjpeg.so
	ln -fs /usr/lib64/libldap.so /usr/lib/libldap.so
	ln -fs /usr/lib64/libpng.so /usr/lib/libpng.so
	cp -frp /usr/lib64/libldap* /usr/lib/
	tar zxvf ${SOFTS_SRC}/${PHP_SRC}.tar.gz -C ${INSTALL_ROOT}
	cd ${INSTALL_ROOT}/${PHP_SRC} && \
		./configure --prefix=${INSTALL_ROOT}/php5 \
		--with-config-file-path=${INSTALL_ROOT}/php5/etc \
		--with-mysql=${INSTALL_ROOT}/mysql \
		--with-mysqli=${INSTALL_ROOT}/mysql/bin/mysql_config \
		--with-libxml-dir=${INSTALL_ROOT}/libxml2 \
		--with-iconv-dir=/usr/local/lib64 \
		--enable-opcache=no \
		--with-freetype-dir \
		--with-jpeg-dir \
		--with-png-dir \
		--with-zlib \
		--with-openssl \
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
	cp  ${PWD}/php/php.ini-production ${INSTALL_ROOT}/php5/lib/php.ini
	mv /usr/local/php5/etc/php-fpm.conf.default ${INSTALL_ROOT}/php5/etc/php-fpm.conf
	${INSTALL_ROOT}/php5/bin/php ${SOFTS_SRC}/go-pear.phar
	cp ${PWD}/php/php-fpm.conf ${INSTALL_ROOT}/php5/etc/php-fpm.conf 


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


zlib:
	tar zxvf ${SOFTS_SRC}/$(ZLIB_FILE) 
	@echo "正在编译zlib模块....."
	cd $(ZLIB_FOLDER); CFLAGS="-O3 -fPIC" ./configure --prefix=$(ZLIB_PATH) --static #--archs="-arch x86_64"
	cd $(ZLIB_FOLDER); make
	cd $(ZLIB_FOLDER); make install
	@echo "编译zlib模块结束............"
git:
	tar zxvf ${SOFTS_SRC}/$(GIT_FILE)
	@echo "build git module...."
	cd $(GIT_FOLDER); \
		./configure \
		--prefix=${LIBSPATH}/git
		#--with-zlib=$(ZLIB_PATH) \
		#--with-curl=$(CURL_PATH) \
		#--with-curl=$(CURL_PATH) \
	cd $(GIT_FOLDER); make
	cd $(GIT_FOLDER); make install
	#ln -s /usr/local/bin/git /usr/bin/git
	ln -sf /libs/git/bin/git /usr/bin/git

	@echo "build git module end"
openssl:
	tar zxvf ${SOFTS_SRC}/$(OPENSSL_FILE)
	@echo "编译openssl模块....."
	#cd $(OPENSSL_FOLDER); ./Configure darwin64-x86_64-cc --prefix=$(OPENSSL_PATH) threads zlib enable-static-engine
	#cd $(OPENSSL_FOLDER); ./config -fPIC shared --prefix=$(OPENSSL_PATH) -L$(ZLIB_LDFLAGS) -I$(ZLIB_CPPFLAGS) threads zlib 
	cd $(OPENSSL_FOLDER); ./config -fPIC --prefix=$(OPENSSL_PATH) -L$(ZLIB_LDFLAGS) -I$(ZLIB_CPPFLAGS) threads zlib enable-static-engine
	cd $(OPENSSL_FOLDER); make
	cd $(OPENSSL_FOLDER); make install
	@echo "编译openssl模块结束............"
jsoncpp:
	@echo "编译jsoncpp模块....."
	unzip ${SOFTS_SRC}/$(SCONS_FILE)
	tar xvf ${SOFTS_SRC}/$(JSONCPP_FILE)
	cd $(JSONCPP_FOLDER);python $(MYSCONS)/script/scons platform=linux-gcc
	#cd $(JSONCPP_FOLDER);python /scons-2.3.0/script/scons platform=linux-gcc
	mkdir -p $(JSONCPP_LDFLAGS)
	cp -fr $(JSONCPP_FOLDER)/include $(JSONCPP_LDFLAGS)
	cp -rf $(JSONCPP_FOLDER)/libs  $(JSONCPP_LDFLAGS)
	@echo "编译jsoncpp模块结束..........."
curl:
	tar xvf ${SOFTS_SRC}/$(CURL_FILE)
	@echo "编译curl模块....."
	cd $(CURL_FOLDER); ./configure --prefix=$(CURL_PATH) \
		LDFLAGS="-L$(ZLIB_LDFLAGS) -L$(OPENSSL_LDFLAGS)" \
		CPPFLAGS="-fPIC -I$(ZLIB_CPPFLAGS) -I$(OPENSSL_CPPFLAGS) -I$(OPENSSL_CPPFLAGS_OPENSSL)" \
		LIBS=-ldl --with-ssl=$(OPENSSL_LDFLAGS)
	cd $(CURL_FOLDER); make
	cd $(CURL_FOLDER); make install
	@echo "编译curl模块结束............"

	#mkdir -p /usr/local/include/curl
	#cp -rv ./lib/.libs/curl/include/curl/*.* /usr/local/include/curl
	#cp -rv ./lib/.libs/curl/lib/*.* /usr/local/lib

	#mkdir -rv /usr/local/include/openssl 
	#cp -rv libs/openssl/include /usr/local/include/openssl 
	#cp -rv libs/openssl/lib/*.* /usr/local/lib 
vim74:
	tar jxvf ${SOFTS_SRC}/vim-7.4.tar.bz2
	tar zxvf ${SOFTS_SRC}/vim-7.2-extra.tar.gz
	tar zxvf ${SOFTS_SRC}/vim-7.2-lang.tar.gz
	mv vim72 vim74
	cd vim74/src; ./configure --enable-multibyte \
		--with-features=huge \
		--disable-selinux
	cd vim74/src; make
	cd vim74/src; make install
	cp vim74/src/vim /usr/local/bin


vimrc:
	git clone https://github.com/charlessoft/vimrc.git
	mv vimrc ~/.vim_runtime
	cd ~/.vim_runtime;sh install_awesome_vimrc.sh

centos_php:
	yum install -y httpd httpd-devel 
	#yum install mysql mysql-server
	yum install -y php php-devel
	yum install -y php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc
	#etc/init.d/httpd restart
	#/var/www/html/
centos_softs:
	yum install -y gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel libtool libtool-libs libevent-devel libevent openldap openldap-devel nss_ldap openldap-clients openldap-servers libtool-ltdl libtool-ltdl-devel bison cmake perl-devel tk ctags
