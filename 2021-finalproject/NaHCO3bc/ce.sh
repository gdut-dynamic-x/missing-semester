#!/bin/bash

#setting environment vatiables
#export  ROS_MASTER_URI=http://192.168.0.100:11311

#test environment variable
if [[ $ROS_MASTER_URI != "0" ]];then

echo "[check] environment variable $ROS_MASTER_URI pass"

else

echo "[check] environment variable $ROS_MASTER_URI not found"

fi


#check whether the environment variable is a vilid http address 






#use ping to check whether IP address which is included in the environment variable can be connected
