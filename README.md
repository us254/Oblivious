<details>
<summary>Click to see </summary>

`apt-get update; apt-get upgrade -y; apt-get install curl wget unzip git socat fail2ban -y; cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local; apt-get install unattended-upgrades apt-listchanges -y; echo | dpkg-reconfigure -plow unattended-upgrades`

`-apt-get install ufw
-ufw status
-ufw enable
-ufw reload
-ufw reset
-ufw allow 80 &&  ufw allow 443  &&  ufw allow 2053 &&  ufw allow 2083 &&  ufw allow 2087 &&  ufw allow 2096 &&  ufw allow 8443
-ufw allow 4488
-nano /etc/ssh/sshd_config
-service ssh restart
-ufw deny 22`
  
  
</details>
