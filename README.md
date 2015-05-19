ci
==

ci 一些手册和脚本
---
文件说明

1.Makefile --文件安装软件功能(设置环境变量未完成--写入有问题,目前手动输入,环境变量内容写在Makefile中)

2.config.sh --用来slave 机器创建jenkins用户

3.Jenkins_Guide.docx --安装部署文档

已知问题:
---
1. Makefile 不能设置环境变量到/etc/profile ..
2. slave 生成的账号需要手动设置ssh-keygen 

todo:
===
1.增加Makefile 输出环境变量参数到/etc/profile..等等 

2.jenkins自动创建ssh-keygen

3.完善安装部署文档


编译命令:
===
master:

$make install_master


slave:

$make install_slave

下载安装包:
===
<del>$git submodule init</del>

<del>$git submodule update</del>

submodule 更新库太慢了,直接下载压缩包放在目录下还快些.
$wget https://github.com/charlessoft/ci_softs/archive/master.zip 


软件下载地址:
===
maven  
http://mirrors.hust.edu.cn/apache/maven/binaries/  
zookeeper  
http://archive.apache.org/dist/hadoop/zookeeper/zookeeper-3.2.2/   

jdk 1.8 x64  
http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz?AuthParam=1414562116_44cb49eadfbb1706094da5b807b167d5  

python 278  
https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz  

getpip.py   
https://bootstrap.pypa.io/get-pip.py   

git 2.4.1  
http://pkgs.fedoraproject.org/repo/pkgs/git/git-2.4.1.tar.gz/c72b2dcff11ebd25cb4fa488d6279717/git-2.4.1.tar.gz  

yum install zlib zlib-devel  
#python 需要  
yum install openssl  
yum install openssl-devel  
  
#requets[security]需要  
yum install libffi-devel  
yum install sqlite-devel -y  
#git https需要  
yum install curl-devel  
