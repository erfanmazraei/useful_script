#!/bin/bash

ssh_user="ubuntu"
port_number="22"

while read -r ip; do
  # SSH to the IP address, execute the ls command, and then exit
  CMD_ONE="sudo su -c 'cd ; wget https://repo.zabbix.com/zabbix/5.2/debian/pool/main/z/zabbix-release/zabbix-release_5.2-1+debian10_all.deb; dpkg -i zabbix-release_5.2-1+debian10_all.deb; apt update; apt install zabbix-agent2'"
  ssh -p $port_number $ssh_user@$ip "$CMD_ONE"
  scp -P $port_number zabbix_agent2.conf $ssh_user@$ip:/home/$ssh_user/zabbix_agent2.conf
  CMD_TWO="sudo su -c 'cp /home/$ssh_user/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf; systemctl restart zabbix-agent2'"
  ssh -p $port_number $ssh_user@$ip "$CMD_TWO"
done < iplist.txt
