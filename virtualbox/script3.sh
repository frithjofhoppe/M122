
database="$PWD/test.db"
sqlite3 $database <<EOF
DROP TABLE test;
CREATE TABLE test (FirstName TEXT, LastName TEXT,PRIMARY KEY(FirstName,LastName));
EOF

counter=0
localCounter = 1

for line in $(cat test.csv)
do
    if [ $counter -ne 0 ]
    then
    echo "line => $line"

    fn=$(echo $line | cut -d"," -f1)

    ln=$(echo $line | cut -d"," -f2)


    sqlite3 $database "INSERT INTO test (FirstName, LastName) VALUES ('$fn','$ln');"

    echo $query
    fi
    counter=$(($counter+1))
done

echo "Data inserted"