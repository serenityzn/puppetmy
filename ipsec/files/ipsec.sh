echo "net.ipv4.ip_forward = 1" |  /usr/bin/tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects = 0" |  /usr/bin/tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects = 0" |  /usr/bin/tee -a /etc/sysctl.conf
for vpn in /proc/sys/net/ipv4/conf/*; do echo 0 > $vpn/accept_redirects; echo 0 > $vpn/send_redirects; done
/sbin/sysctl -p
if [ $? -eq 255 ];then 
	exit 0 
fi
