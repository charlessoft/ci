sudo /usr/sbin/useradd -m jenkins -d /home/jenkins 
echo "jenkins:jenkins" | chpasswd
su - jenkins
