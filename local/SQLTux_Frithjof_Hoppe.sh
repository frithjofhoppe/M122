#!/bin/bash


database="$PWD/linuxusers.db"

sqlite3 $database <<EOF
DROP TABLE LinuxUsers;
CREATE TABLE LinuxUsers (UID INTEGER, GID INTEGER ,Home TEXT);
EOF

grep -iE "(root|vm+|+tux)" /etc/passwd | while read line
    do
	username=$(echo $line | cut -d":" -f1)
	password=$(echo $line | cut -d":" -f2)
	uid=$(echo $line | cut -d":" -f3)
	gid=$(echo $line | cut -d":" -f4)
	comment=$(echo $line | cut -d":" -f5)
	homedir=$(echo $line | cut -d":" -f6)
	logincmd=$(echo $line | cut -d":" -f7)
	sqlite3 $database "INSERT INTO LinuxUsers VALUES($uid,$gid,'$homedir')"
    done

sqlite3 $database "SELECT * FROM LinuxUsers"

echo "SUCCESS: imported"