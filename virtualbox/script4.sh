
database="$PWD/test.db"
if [ "$1" = "del" ]
then
sqlite3 $database <<EOF
DROP TABLE test;
CREATE TABLE test (FirstName TEXT, LastName TEXT,PRIMARY KEY(FirstName,LastName));
EOF
fi

counter=0
localCounter = 1

for line in $(cat test.csv)
do
    query="INSERT INTO test (FirstName,LastName) VALUES ("
    if [ $counter -ne 0 ]
    then
	for i in {1..2}
	do
	    param=$(echo $line | cut -d"," -f$i)
	    if [ "$param" != "" ]
	    then
		query="$query'$param'"
	    else
		query+="null"
	    fi
	    
	    if [ $i -eq 2 ]
	    then
		query="$query)"
	    else
		query="$query,"
	    fi
	done
	echo $query
	result=$(sqlite3 $database "$query")
    fi
    counter=$(($counter+1))
done

echo "Data inserted"