
1: `
apt-get update; apt-get upgrade -y; apt-get install curl wget unzip git socat fail2ban -y; cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local; apt-get install unattended-upgrades apt-listchanges -y; echo | dpkg-reconfigure -plow unattended-upgrades
`
