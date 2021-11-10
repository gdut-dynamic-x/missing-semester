#!/bin/sh
check_MASTER()
{
	echo -n "[check] environment variable... "
	echo $ROS_MASTER_URI | export $ROS_MASTER_URI=http://192.168.0.100:11311
if [[ -z $ROS_MASTER_URI ]]
then
        echo 'no found'
        exit
else
        echo  'No problem'
fi
}
check_MASTER
#检查ROS_MASTER_URI环境变量是否为空

check_http()
{
	echo -n "[check] address avlidation...  "
	echo $ROS_MASTER_URI | awk 'http:\/\/((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}:((6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d'
if [[ $?=0 ]]
then
	echo 'Error'
else
	echo 'Pass'
	exit
fi
}
check_http
#检查该环境变量的http地址是否有效

check_IP()
{
	ping -c 3 -w $ROS_MASTER_URI>dev/null
echo -n "[check ]ping address...  "
echo 'Pass'
}
check_IP
#检查该环境变量的IP是否可连通

echo "All Check Passed"
