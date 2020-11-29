sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt -y install ansible

# Setup the configuration file
sudo cat <<EOF >>/etc/ansible/ansible.cfg
[defaults]
inventory = hosts
remote_user = vagrant
private_key_file = ~/.ssh/id_rsa
host_key_checking = False
deprecation_warnings = False
EOF

# Create a group with the hosts
sudo cat <<EOF >>/etc/ansible/hosts
[wordpress]
192.168.33.11

[elastik]
192.168.33.12
EOF

# Generate a ssh-key and copy it to shared folder /vagrant
su vagrant -c 'ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""'
cp .ssh/id_rsa.pub /vagrant/


# Run these 2 commands when all the 3 machines are up and running
# ansible-playbook -b /vagrant/ELK-playbook/site.yml 
# ansible-playbook -b /vagrant/wordpress-playbook/site.yml
