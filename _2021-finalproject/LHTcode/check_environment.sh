#!/usr/bin/bash

environment=0
if [[ -n $ROS_MASTER_URI ]];then

	echo "[Check] environment variable... Pass"
	environment=$ROS_MASTER_URI
else
	echo "[Check] environment variable... Faile"
	exit -1
fi
echo $environment > ~/cache.txt
if [[ $(cat ~/cache.txt | sed -E 's/http:\/\/.*:.*$//') -eq "" ]];then	
	echo "[Check] address validation...   Pass" 		
else
	echo "[Check] address validation...   Faile"
	rm ~/cache.txt
	exit -1
fi
ping -w5 $(cat ~/cache.txt | sed -E 's/http:\/\/(.*):.*$/\1/') >> ~/cache.txt

if [[ $(cat ~/cache.txt | grep "已发送" | sed -E 's/^.*(100).*$/\1/') -eq 100 ]];then
	echo "[Check] ping address...         Faile"
else 
	echo "[Check] ping address...         Pass"
fi
rm ~/cache.txt
