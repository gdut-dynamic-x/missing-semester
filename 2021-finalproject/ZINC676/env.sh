#!/bin/bash
export ROS_MASTER_URI=http://192.168.0.100:11311
echo $ROS_MASTER_URI > IP.txt
result=$( cat IP.txt | grep "^http://[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}:[0-9]\{1,5\}" )
http=$( cat IP.txt | grep -o "http://" )
IP=$( cat IP.txt | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" )
ip_and_port=$( cat IP.txt | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}:[0-9]\{1,5\}" )
#echo "The link is-----$result"
#echo "The IP of the link is-----$IP"
#echo "The ip and port of the link is-----$ip_and_port"
#using the regular expression to search what I want
echo -e "\n Now is checking time.\n"

#Firstly,let us check if the ROS_MASTER_URI env is empty or not.
echo  "-----checking environment,wait a moment please."
 if [ 0"$ROS_MASTER_URI" = "0" ]; then
	 echo "[Warning]environment erro"
 else
	 echo "[Check] environment variable-----Pass" 
 fi

#Secondly,check the http addres is variable or not.
if [[ $http = http:// ]]; then
	http_check=1
else
	http_check=0
fi

echo "-----checking http address,wait a moment please."
if [[ $http_check=1 ]];then

	if [[ $ip_and_port =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]{1,5}$ ]]; then
		echo "[Check] address legal----------pass"
	else
		echo "[Warning} address is illgal"
	fi
else
	echo "[Warning] not a legal http"
fi




#Third,ping address
echo "-----checking ping address,please wait a moment"

ping -c2 -i0.1 -W1 "$IP" &>/dev/null
if [ $? -eq 0 ]; then
	echo "[Check] ping address-----pass"
else
	echo "[Warning] IP is down"
fi




