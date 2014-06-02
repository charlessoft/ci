#jenkins 遇到问题

##Q: slave /usr/bin/java does not found
##A: slave中需要安装jdk,jenkins默认查找jdk的路径是/usr/bin/java,解决方法,设置ln链接, cygwin中 
	ln -s /cygdrive/c/Program\ Files\ \(x86\)/Java/jdk1.6.0_38/bin/java.exe /usr/bin/java
