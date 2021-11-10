#!/bin/bash

#setting environment vatiables
export  ROS_MASTER_URI=http://192.168.0.100:11311

#test environment variable
if [[ $ROS_MASTER_URI != "0" ]];then

echo "[check] environment variable...  pass"

else

echo "[check] environment variable...  not found"

fi

#check whether the environment variable is a vilid http address 

if [["$ROS_MASTER_URI" == "http://*.*.*.*:*"]];then
echo "[check] address validation...pass"
else
echo "[check] address validation... no pass"
fi

#use ping to check whether IP address which is included in the environment variable can be connected

export | grep $ROS_MASTER_URI

ping -c 1 192.168.0.100

if [[ $? != "0" ]];then

echo "[check] ping address... pass"
else
echo  "no pass"

fi
