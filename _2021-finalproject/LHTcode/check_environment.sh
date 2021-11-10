#!/usr/bin/bash
export ROS_MASTER_URI=http://192.168.0.100:11311
environment=0
# 这里检查环境变量是否存在，-n是字符串判断，如果字符串为空则False
if [[ -n $ROS_MASTER_URI ]];then
	echo "[Check] environment variable... Pass"
	environment=$ROS_MASTER_URI
else
	echo "[Check] environment variable... Faile"
	exit -1
fi
# 将环境变量传入主目录下的cache文件，判断IP格式是否正确，判断方法是用sed查看是否能切掉完整的环境变量，完全切掉则格式正确
echo $environment > ~/cache.txt
if [[ $(cat ~/cache.txt | sed -E 's/http:\/\/.*:.*$//') -eq "" ]];then	
	echo "[Check] address validation...   Pass" 		
else
	echo "[Check] address validation...   Faile"
	rm ~/cache.txt
	exit -1
fi
# ping5秒，5秒还没东西输出就判断为ping不上
target_IP=$(cat ~/cache.txt | sed -E 's/http:\/\/(.*):.*$/\1/')		#记录目标IP地址
ping -w5 $target_IP >> ~/cache.txt

if [[ $(cat ~/cache.txt | grep "已发送" | sed -E 's/^.*(100).*$/\1/') -eq 100 ]];then
	echo "[Check] ping address...         Faile"
else 
	echo "[Check] ping address...         Pass"
fi

# if语句判断命令ifconfig是否下载
ifconfig -a > ~/cache.txt
if [[ $? -ne 0 ]];then
	sudo apt install net-tools
	ifconfig -a > ~/cache.txt
fi
# 获得本机的IP地址和子网掩码
local_IP=$(cat ~/cache.txt | grep "inet.*broadcast.*" | sed -E 's/.*inet (.*) .*netmask.*broadcast.*$/\1/')
local_netmask=$(cat ~/cache.txt | grep "inet.*broadcast.*" | sed -E 's/.*inet.*.*netmask (.*) broadcast.*$/\1/')

# 计算本机所在子网（用ipcalc工具）
ipcalc $local_IP $local_netmask > ~/cache.txt
local_network=$(cat ~/cache.txt | grep 'Network:')

# 计算目标IP所在子网
ipcalc $target_IP $local_netmask > ~/cache.txt
target_network=$(cat ~/cache.txt | grep 'Network:')

# 比较两个子网是否相等
if [[ $local_network == $target_network ]];then
	echo '[Check] same subnet...          Pass'
else
	echo '[Check] same subnet...          Faile'
fi
rm ~/cache.txt


