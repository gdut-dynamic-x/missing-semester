#!bin/bash

#检查ROS_MASTER_URI是否存在
echo "[Check] environment variable"
 
if [ $ROS_MASTER_URI ]; then
	echo " Pass"
       
else
      	echo " Error"
fi

#检查地址是否有效
echo "[Check] address variable"
if [ "$ROS_MASTER_URI"="http://*:*" ]; then
	echo " Pass"
	
else
	echo " Error"
	
fi

#检查连通性
	IP=$ROS_MASTER_URI
	IP=${IP:7}
	IP=${IP%:*}
echo "[Check] ping address"
echo "Checking ip : $IP" 

if [ `ping $IP -c 2 | grep 'rtt' | cut -c1-3` ]; then
	echo " Pass"
	
       
else
	echo " Error"
	
fi
#判断是否处于同一子网
same_subnet ()
{
	echo -n "[Check] same subset...          "
	mask=$(ifconfig | grep "netmask" | grep "broadcast" | sed -E s/.*netmask// | awk '{print $1}' | tail -1)
	ip=$(echo $ROS_MASTER_URI | sed -E "s/http:\/\///" | sed -E "s/:.*//")
	localip=$(ip a | grep inet | grep -v inet6 | awk -F 'inet ' '{print $2}' | awk -F '/' '{print $1}' | tail -1)
	a=$(echo ${mask} | awk -F '{print $1}')
	b=$(echo ${mask} | awk -F '{print $2}')
	c=$(echo ${mask} | awk -F '{print $3}')
	d=$(echo ${mask} | awk -F '{print $4}')
	let int_mask=a*256*256*256+b*256*256+c*256+d
	e=$(echo ${ip} | awk -F '{print $1}')
	f=$(echo ${ip} | awk -F '{print $2}')
	g=$(echo ${ip} | awk -F '{print $3}')
	h=$(echo ${ip} | awk -F '{print $4}')
	let int_ip=e*256*256*256+f*256*256+g*256+h
	i=$(echo ${localip} | awk -F '{print $1}')
	j=$(echo ${localip} | awk -F '{print $2}')
	k=$(echo ${localip} | awk -F '{print $3}')
	l=$(echo ${localip} | awk -F '{print $4}')
	let int_localip=i*256*256*256+j*256*256+k*256+l
	if [[ $((${int_mask}+${int_ip})) -eq $((${int_mask}+${int_localip})) ]]
	then
		echo "Pass"
	else
		echo "Error"
	fi
}

same_subnet

echo "All Check Passed"
