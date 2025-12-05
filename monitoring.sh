#!bin/bash

cmd=$(uname -a)
echo "Architecture : $cmd"


socket=$(lscpu | grep Socket | mawk '{print $2}')
echo "CPU physical : $socket"


cpu=$(lscpu | grep -m 1 CPU\(s\): | mawk '{print $2}')
echo "vCPU : $cpu"


totalmem=$(free --kilo | grep Mem | mawk '{print $2}')
usedmem=$(free --kilo | grep Mem | mawk '{print $3}')
percent=$((usedmem/totalmem*100))
if [[ ${#usedmem} -lt 3 ]]; then
	echo "Memory Usage : ${usedmem}/${totalmem}KB (${percent}%)"
else
	usedmem=$((usedmem/1000))
	totalmem=$((totalmem/1000))
	echo "Memory Usage : ${usedmem}/${totalmem}MB (${percent}%)"
fi


useddisk=$(df --si --total | grep total | mawk '{print $3}')
totaldisk=$(df --si --total | grep total | mawk '{print $4}')
percent=$(df --si --total | grep total | mawk '{print $5}')
echo "Disk Usage : ${useddisk}/${totaldisk} (${percent})"


#please ignore wtf is going on here, top do be quirky
tester=$(top -b -n 1 | grep %Cpu | mawk '{print $7}')
badcolumn="ni,"
if [[ "$tester" == "$badcolumn" ]]; then
	cmd=$(top -b -n 1 | grep %Cpu | mawk '{print $8}' | sed 's/[ ni,]//g')
else
	cmd=$(sed 's/[ ni,]//g' <<< $tester)
fi
cmd=${cmd%.?}
cmd=$((100-$cmd))
echo "CPU load : ${cmd}%"


day=$(who -b | mawk '{print $3}')
hour=$(who -b | mawk '{print $4}')
echo "Last boot : $day $hour"


cmd=$(cat /etc/fstab | grep /dev/mapper/ | wc -l)
if [[ $cmd -gt 0 ]]; then
	cmd="yes !"
else
	cmd="No ?? bro your b2br is shit what the hell"
fi
echo "LVM use ?: $cmd"


cmd=$(ss -s | grep -m 1 TCP | mawk '{print $4}' | sed 's/,//g')
echo "TCP connections : $cmd established connections"


cmd=$(w | grep / | wc -l)
echo "User(s) logged in : $cmd"


ip=$(hostname -I | sed 's/ //')
mac=$(ip link | grep link/ether | awk '{print $2}')
echo "Network addresses : IP (${ip}) MAC (${mac})"


cmd=$(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l)
echo "Sudo used : $cmd times"
