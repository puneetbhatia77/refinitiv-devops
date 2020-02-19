wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

sudo apt-get update
sudo apt-get -y install default-jre
sudo apt-get -y install jenkins
sudo journalctl -u jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo ufw allow 8080
sudo ufw status

# http://ip_address_or_domain_name:8080
# /var/lib/jenkins/secrets/initialAdminPassword
# install suggested plugins