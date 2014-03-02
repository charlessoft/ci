if cat /etc/passwd | awk -F  : '{print $1}' | grep jenkins >/dev/null 2>&1
then
    echo "user already exist"
else
    sudo /usr/sbin/useradd -m jenkins -d /home/jenkins 
fi
echo "jenkins:jenkins" | chpasswd
su - jenkins
#ssh-keygen
#cd .ssh
#cat id_rsa.pub > authorized_keys
#chmod 700 authorized_keys
