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
ping $(cat ~/cache.txt | sed -E 's/http:\/\/(.*):.*$/\1/') 
rm ~/cache.txt
