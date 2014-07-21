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

