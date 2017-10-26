#!/bin/bash

rm LinuxUsers
rm LinuxOrdered

cat /etc/passwd | while read line
    do
	username=$(echo $line | cut -d":" -f1)
	password=$(echo $line | cut -d":" -f2)
	uid=$(echo $line | cut -d":" -f3)
	gid=$(echo $line | cut -d":" -f4)
	comment=$(echo $line | cut -d":" -f5)
	homedir=$(echo $line | cut -d":" -f6)
	logincmd=$(echo $line | cut -d":" -f7)
	echo -e  $username "\t"  $password "\t"  $uid "\t" $gid "\t"  $comment "\t"  $homedir "\t"  $logincmd >> LinuxUsers
    done
column -t -s $'\t' LinuxUsers >> LinuxOrdered

echo "SUCCESS: open LinuxUsers"