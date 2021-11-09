#!/bin/env bash
#Name:check-environment.sh
#desc:Check the environment variable ROS_MASTER_URI
#Update:2021-11-09

export ROS_MASTER_URI=https://192.168.0.100:11311

#check whether the environment variable ROS_MASTER_URI is empty
echo "[Check] environment variable "
if test -z "$ROS_MASTER_URI";then
    echo "ROS_MASTER_URI is NULL"
else
    echo "ROS_MASTER_URI=$ROS_MASTER_URI"
fi

#check the address is available or not
echo "[Check] address validation  "
url=$(echo $ROS_MASTER_URI |awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print"yes"}')

if ["$url" == ''];then
	echo "This http address is available!"
else
	echo "This http address is not available!"
fi

#check whether the IP address is avaiable
echo "[Check] ping address  "
ping -c2 -i0.3 -W1 192.168.0.100:11311
if [ $? -eq 0 ]; then
    echo "192.168.0.100:11311 is up"
else
    echo "192.168.0.100:11311 is down"
fi

