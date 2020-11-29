Vagrant.configure("2") do |config|

    config.vm.define "ansible" , primary: true do |ansible|
        ansible.vm.box = "ubuntu/bionic64" 
        ansible.vm.hostname = "ansible"
        ansible.vm.network "private_network", ip: "192.168.33.13", nic_type: "virtio", virtualbox__intnet: "keepcoding"
        ansible.vm.network "forwarded_port", guest: 80, host: 8082
        ansible.vm.synced_folder ".", "/vagrant"    
        ansible.vm.provision "shell", path: "ansible.sh"
        ansible.vm.provider "virtualbox" do |vb|
            vb.memory= 1024
            vb.cpus = 4
            vb.default_nic_type = "virtio"
        end
    end    
    
    config.vm.define "wordpress" do |wordpress|
        wordpress.vm.box = "ubuntu/bionic64" 
        wordpress.vm.hostname = "wordpress"
        wordpress.vm.network "private_network", ip: "192.168.33.11", nic_type: "virtio", virtualbox__intnet: "keepcoding"
        wordpress.vm.network "forwarded_port", guest: 80, host: 8081
        wordpress.vm.synced_folder ".", "/vagrant"    
        wordpress.vm.provision "shell", inline: <<-SHELL
            cat /vagrant/id_rsa.pub >> .ssh/authorized_keys 
        SHELL
        wordpress.vm.provider "virtualbox" do |vb|
            vb.memory= 1024
            vb.cpus = 2
            vb.default_nic_type = "virtio"
        end
    end

    config.vm.define "elastik" do |elastik|
        elastik.vm.box = "ubuntu/bionic64" 
        elastik.vm.hostname = "elastik"
        elastik.vm.network "private_network", ip: "192.168.33.12", nic_type: "virtio", virtualbox__intnet: "keepcoding" 
        elastik.vm.network "forwarded_port", guest: 5601, host: 5601
        elastik.vm.network "forwarded_port", guest: 9200, host: 9200
        elastik.vm.synced_folder ".", "/vagrant"
        elastik.vm.provision "shell", inline: <<-SHELL
            cat /vagrant/id_rsa.pub >> .ssh/authorized_keys 
        SHELL
        elastik.vm.provider "virtualbox" do |vb|
            vb.memory= 4096
            vb.cpus = 2
            vb.default_nic_type = "virtio"
        end
    end           

end