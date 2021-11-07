#!/bin/bash

#test the environment for the ipconfig(ifconfig)

export | grep ROS_MASTER_URI
a=$?
if [$a != '0' ];then
	echo "the environment? where is it?"
else
	echo "ok, I found the environment, let's go."
fi
#check the environment address is available or not
url=$(echo $ROS_MASTER_URI |awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print"yes"}')

if ["$url" == ''];then
	echo "This http address is available!"
else	
	echo "This http address is not available!"
fi
#now ping ROS_MASTER_URI and its ip.

echo -n "checking ping address..." 
echo 
	ip1=$(echo $ROS_MASTER_URI | sed -E "s/http:\/\///" | sed -E "s/:.*//")
	ping -c 3 -w 5 ${ip1} > /dev/null
	#I pushed the data into the bin for the beauty of the whole demonstrate.
if [ $? -eq 0 ] ;then
	echo "OK,we ping successfully to the ROS_MASTER_URI...Really?"
else
	echo "?Maybe something wrong.Please check your ip connection."
fi
#last one:judge if the local ip is in the same subnet with target ip
echo "local ip now :"
ifconfig | awk '/netmask/{print $0}' | awk 'NR==2'
echo "target ip now :"
echo $ip1

echo "It isn't the same apparently!"
echo "now I will correct them to the same ip so that my ros system can connect to my PC correctly!"
 
 #grep -B10
 #hangline=`grep -B2 -n   'DROP IF EXISTS PARTITION'  a.sql|grep 'FROM'|awk -F ' ' '{print $1}' |sed 's/-//g'`
 #sedcom="${hangline}s/${tablename}/${tablename}_BAKTEMP/"
echo "Something maybe be hard because I can't get the hang of the shell. You have to add the code of line40 ""in to the popup by yourself.Sorry for that."
echo "tablename="GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"""
sudo gedit /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0""
echo ip=$(ip addr show wlan0 | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | grep -o [0-9].*)>gedit ~/.bashrc
export ROS_HOSTNAME=$ip
export ROS_MASTER_URI=http://$ip:11311
export ROS_MASTER_URI=http://192.168.1.102:11311
#only shows what happen after ip was correctly changed
echo "local ip now :"
ifconfig | awk '/netmask/{print $0}' | awk 'NR==2'
echo "target ip now :"
echo $ip1
echo "What about now? I changed the system settings now and you don't have to change your URI once you open your pc"
echo "Now you only need to source your setup.bash!"
#export | grep ROS_MASTER_URI
