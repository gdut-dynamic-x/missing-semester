#判断环境变量是否存在
echo -n "[Check] environment varible... "
if [ $ROS_MASTER_URI ];then
	echo "Pass"
else
	echo "Failed"
fi
#判断环境变量地址是否有效，将不符合格式的地址替换为空字符串，符合格式的完整保留
echo -n "[Check] address validation...  "
a=$(echo $ROS_MASTER_URI | sed -E 's/(http:\/\/.*:.*)/\1/')
if [ $a ];then
	echo "Pass"
else
	echo "Failed"
fi
#判断环境变量地址能否ping上，5秒钟ping不上则自动断开并判断为失败
echo "[Check] ping address...         "
if ping -q -w 5 $(echo $ROS_MASTER_URI | sed -E 's/http:\/\/(.*):.*/\1/');then
	echo "Pass"
else
	echo "Failed"
fi
#判断环境变量ip是否与本级ip处于同一子网
echo -n "[Check] same subnet...         "
a1=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$2}'| sed -E 's/(.*)\..*\..*\..*/\1/')
b1=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$4}'| sed -E 's/(.*)\..*\..*\..*/\1/')
c1=$(($a1&$b1))
a2=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$2}'| sed -E 's/.*\.(.*)\..*\..*/\1/')
b2=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$4}'| sed -E 's/.*\.(.*)\..*\..*/\1/')
c2=$(($a2&$b2))
a3=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$2}'| sed -E 's/.*\..*\.(.*)\..*/\1/')
b3=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$4}'| sed -E 's/.*\..*\.(.*)\..*/\1/')
c3=$(($a3&$b3))
a4=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$2}'| sed -E 's/.*\..*\..*\.(.*)/\1/')
b4=$(ifconfig wlp4s0 |sed -n 2p |awk -F ' ' '{print$4}'| sed -E 's/.*\..*\..*\.(.*)/\1/')
c4=$(($a4&$b4))
d1=$(echo $ROS_MASTER_URI | sed -E 's/http:\/\/(.*):.*/\1/' | sed -E 's/(.*)\..*\..*\..*/\1/')
f1=$(($d1&$b1))
d2=$(echo $ROS_MASTER_URI | sed -E 's/http:\/\/(.*):.*/\1/' | sed -E 's/.*\.(.*)\..*\..*/\1/')
f2=$(($d2&$b2))
d3=$(echo $ROS_MASTER_URI | sed -E 's/http:\/\/(.*):.*/\1/' | sed -E 's/.*\..*\.(.*)\..*/\1/')
f3=$(($d3&$b3))
d4=$(echo $ROS_MASTER_URI | sed -E 's/http:\/\/(.*):.*/\1/' | sed -E 's/.*\..*\..*\.(.*)/\1/')
f4=$(($d4&$b4))
if [ $c1 -eq $f1 ];then
	if [ $c2 -eq $f2 ];then
		if [ $c3 -eq $f3 ];then
			if [ $c4 -eq $f4 ];then
				echo "pass"
			else
				echo "failed"
			fi
		else
		       	echo "failed"
		fi
	else
		echo "failed"
	fi
else
	echo "failed"
fi
