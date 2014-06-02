使用说明
1.创建jenkins 用户
2.生成ssh key,放在jenkins的 ~/.ssh目录下
ssh-keygen
cat ~/.ssh/id_rsa.pub >> jenkins@localhost:~/.ssh/authorized_keys
