#!/bin/bash

echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu
wget https://github.com/v2rayA/v2rayA/releases/download/v2.2.4/installer_debian_x64_2.2.4.deb
dpkg --install installer_debian_x64_2.2.4.deb
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh)

sudo systemctl start v2raya.service
sudo systemctl enable v2raya.service

echo "ClientAliveInterval 1200" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 6" >> /etc/ssh/sshd_config
echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config
sudo service ssh restart


# in ubuntu account : vim .ssh/authorized_keys
# set /etc/resove.config