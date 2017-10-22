counter=0
if [ "$1" != "" ]
then
    if [ -e "$1" ]
    then
	for line in $(cat "$1")
	do
	    counter=$(($counter+1))
	done
    fi
fi

echo "$counter"