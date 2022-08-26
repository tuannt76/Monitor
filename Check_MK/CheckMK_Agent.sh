#!/bin/bash
#Gan bien ten OS
b=$(egrep '^NAME=' /etc/os-release)
#Gan bien link download
#Link tai cho Centos
LC=http://10.0.11.61/Sun_vmware/check_mk/agents/check-mk-agent-2.0.0p27-1.noarch.rpm
#Link tai cho Ubuntu
LU=http://10.0.11.61/Sun_vmware/check_mk/agents/check-mk-agent_2.0.0p27-1_all.deb
#ID BOT telegram
USERID="-611769354"
#TOKEN BOT telegram
TOKEN="5222266765:AAEPQw203mXLzO-r43PMado5PWBrwybqKjM"
#URL
URL="https://api.telegram.org/bot${TOKEN}/sendMessage"
#TIME
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
#IP
my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
#TEXT Send to telegram
TEXT=$(echo -e "Install Succsess CheckMK Agent\nTIME:${DATE_EXEC}\n IP Agent:$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')")
#Kiem tra OS
if [[ "$b" =~ .*"Ubuntu".* ]]; 
then
#Cai dat tren Ubuntu
  echo "OS dang su dung la Ubuntu tien hanh cai dat CheckMK"
  echo "Tien hanh cai dat checkMK Agent tren Ubuntu"
  echo "cai dat Wget"
  	apt-get install wget
  echo "Download Agent"
	wget $LU
  echo "Cap quyen cho file vua Download"
	chmod +x check-mk-agent_2.0.0p27-1_all.deb
  echo "Cai dat agent"
	dpkg -i check-mk-agent_2.0.0p27-1_all.deb
  echo "Cai dat xinetd"
	apt-get install xinetd
  echo "Khoi dong xinetd"
	systemctl start xinetd
	systemctl enable xinetd
  echo "Cai dat net-tools"
	apt-get install -y net-tools
  echo "Chinh sua file de mo Port tren client"
	sed -i 's/\#only\_from      = 127.0.0.1 10.0.20.1 10.0.20.2/only\_from      =10.0.11.61/g' /etc/xinetd.d/check_mk
	sed -i 's/disable        = no/disable        =0/g' /etc/xinetd.d/check_mk
	#sed -i 's/port           = 6556/port           = /g' /etc/xinetd.d/check_mk
  echo "Kiem tra Port da hoat dong chua"
  netstat -npl | grep 6556
	#export netstat=$(netstat -npl | grep 6556)
		#if [[ "$netstat" =~ .*"tcp6       0      0 :::6556                 :::*                    LISTEN      1/systemd`".* ]]; 
		#then
  		#echo "Cong da co the duoc su dung"
  		#else
		#echo "Cong khong the duoc su dung"
		#fi
  echo "Mo port trên firewall"
	firewall-cmd --add-port=6556/tcp --permanent
 	firewall-cmd --reload
  echo "Tat SELinux"
	setenforce 0
  echo "Cai dat hoan tat tien hanh gui thong bao ve telegram"
  echo "Cai dat goi can thiet de gui tin nhan ve telegram"
	apt-get update
	apt-get install -y jq
    	curl -S -X POST "$URL" -d chat_id="$USERID" -d text="$TEXT"
  echo -n "Ban muon khoi dong lai he thong chu:(y/n) "
  	read button
  	c=$button 
	if [[ "$c" =~ .*"y".* ]]; 
	then
	reboot
	fi
elif [[ "$b" =~ .*"CentOS".* ]]; 
then
#Cai dat tren CentOS
  echo "OS dang su dung la CentOS tien hanh cai dat checkMK"
  echo "Tien hanh cai dat checkMK Agent tren CentOS"
  echo "cai dat Wget"
	yum install -y wget
  echo "Download Agent"
	wget $LC
  echo "Cap quyen cho file vua Download"
	chmod +x check-mk-agent-2.0.0p27-1.noarch.rpm
  echo "Cai dat agent"
	rpm -ivh check-mk-agent-2.0.0p27-1.noarch.rpm
  echo "Cai dat xinetd"
	yum install xinetd -y
  echo "Khoi dong xinetd"
	systemctl start xinetd
	systemctl enable xinetd
  echo "Cai dat net-tools"
	yum install -y net-tools
  echo "Chinh sua file de mo Port tren client"
	sed -i 's/\#only\_from      = 127.0.0.1 10.0.20.1 10.0.20.2/only\_from      =10.0.11.61/g' /etc/xinetd.d/check_mk
	sed -i 's/disable        = no/disable        =0/g' /etc/xinetd.d/check_mk
	#sed -i 's/port           = 6556/port           = /g' /etc/xinetd.d/check_mk

  echo "Kiem tra Port da hoat dong chua"
	netstat -npl | grep 6556
  #export netstat=$(netstat -npl | grep 6556)
		#if [[ "$netstat" =~ .*"tcp6       0      0 :::6556                 :::*                    LISTEN      1/systemd`".* ]]; 
		#then
  		#echo "Cong da co the duoc su dung"
		#else
		  #echo "Cong khong the duoc su dung"
		#fi
  echo "Mo port trên firewall"
	firewall-cmd --add-port=6556/tcp --permanent
 	firewall-cmd --reload
  echo "Tat SELinux"
	setenforce 0
  echo "Cai dat hoan tat tien hanh gui thong bao ve telegram"
  echo "Cai dat goi can thiet de gui tin nhan ve telegram"
	yum install epel-release -y
	yum install jq -y
	curl -S -X POST "$URL" -d chat_id="$USERID" -d text="$TEXT"
  echo -n "Ban muon khoi dong lai he thong chu:(y/n) "
  	read button
  	c=$button 
  	if [[ "$c" =~ .*"y".* ]]; 
  	then
  	  reboot
  	fi
else
echo "He dieu hanh khong phai Ubuntu hay Centos vui long xem lai" 
fi
exit 0