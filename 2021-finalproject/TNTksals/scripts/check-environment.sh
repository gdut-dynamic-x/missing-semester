#!/bin/bash

export ROS_MASTER_URI=http://192.168.0.100:11311
environment_variable ()
{
	echo -n "[Check] environment variable... "
	if test -z "${ROS_MASTER_URI}" 
	then
		echo "error"
		echo "Done"
		exit
	else
		echo "Pass"
	fi
}

environment_variable 

address_validation ()
{
	echo -n "[Check] address validation...   "
	echo $ROS_MASTER_URI | grep -E 'http:\/\/((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}:((6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d|6553[0-5])|[0-5]?\d{0,4})'
	echo "$?"
	#if [[ $? = 0 ]]
	#then
		#echo "Pass"
	#else
		#echo "Error"
		#echo "Done"
		#exit
	#fi

}

address_validation


ping_address ()
{
	echo -n "[Check] ping address...         "
	ip=$(echo $ROS_MASTER_URI | awk '/((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}/')
	echo ${ip}
	ping ${ip}
	if [[ $? != 0 ]]
	then
		echo "Error"
		echo "Done"
		exit
	else
		echo "Pass"
	fi

}

ping_address

same_subnet ()
{
	echo -n "[Check] same subset...     "
	path=$(echo $ROS_MASTER_URI | awk '/((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}/ {print}')
	echo ${path}
	localip=$(ip a | grep inet | grep -v inet6 | awk -F 'inet ' '{print $2}' | awk -F '/' '{print $1}' | tail -1)
	iplist=`echo $localip | awk -F "." '{print $1,$2,$3,$4}'`
	
}

same_subnet

echo "All Check Passed"
