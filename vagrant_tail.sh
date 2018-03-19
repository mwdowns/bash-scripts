#!/bin/bash
echo "password for vagrant?"
read -s vagrantPassword
expect <<EOF
spawn ssh root@10.0.0.10
expect "root@10.0.0.10's password:"
send $vagrantPassword\r
expect "vagrant:~#"
send "tail -f /var/log/apache2/*.log /var/log/apache2/*/*.log /var/log/netmining/*/*/*.log /var/log/php5/apache2.log\r"
expect "$ "
EOF