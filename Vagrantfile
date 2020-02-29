# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "kube-03" do |kube|
    kube.vm.hostname = "kube-03"
    kube.vm.network "private_network", ip: "192.168.56.103"
    config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", 2048]
       vb.customize ["modifyvm", :id, "--cpus", 1]
    end
    kube.vm.provision "shell", inline: $script
   end

   
 config.vm.define "kube-02" do |kube|
    kube.vm.hostname = "kube-02"
    kube.vm.network "private_network", ip: "192.168.56.102"
    config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", 2048]
       vb.customize ["modifyvm", :id, "--cpus", 1]
    end
    kube.vm.provision "shell", inline: $script
  end
  
  
  config.vm.define "kube-01" do |kube|
    kube.vm.hostname = "kube-01"
    kube.vm.network "private_network", ip: "192.168.56.101"
    config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", 2048]
       vb.customize ["modifyvm", :id, "--cpus", 2]
    end  
    kube.vm.provision "shell", inline: $script
	#kube.vm.provision "shell", inline: "sudo apt-get install ubuntu-desktop -y"
  end
  
$script = <<SCRIPT
echo I am provisioning...
sudo cp /vagrant/hosts /etc/hosts
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update 
sudo apt-get install -y docker.io kubelet kubeadm kubectl kubernetes-cni
sudo rm -rf /var/lib/kubelet/*
echo I am turning off swap...
sudo swapoff -a
echo I am joining NFS...
sudo apt-get install nfs-common -y
SCRIPT

end