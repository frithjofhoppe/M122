#!/bin/bash


database="$PWD/SIX_Bankenstamm.db"
first=0
sqlite3 $database <<EOF
DROP TABLE SIX_Bankenstamm;
CREATE TABLE SIX_Bankenstamm ('Sort-Nr.' INTEGER PRIMARY KEY, BCNr INTEGER, 'TEIL. IBAN-Tool' INTEGER,'PZ Validierung' INTEGER, 'BCNR IID' INTEGER, Landcode TEXT, 'Postkonto in' TEXT,'Postkonto out' TEXT, SWIFT TEXT, 'Emailadresse Entwickler' TEXT, Mutationsdatum TEXT, Hauptsitz INTEGER, 'BC-Art' INTEGER, 'Bank / Institut' TEXT, SIC INTEGER, 'euro-sic' INTEGER, Sprache INTEGER, 'Kurz.bez.' TEXT, Domizil TEXT, Postadresse TEXT, PLZ INTEGER, Ort TEXT, Telefon TEXT, Fax TEXT, Vorwahl INTEGER);
EOF

rm fileOutput.sql

more SIX_BankenstammCH_3.csv  | while read line

    do
    querry='INSERT INTO SIX_Bankenstamm VALUES('
    if [ $first -gt 0 ]
    then
	
	for i in {1..25};
	do
	    temp=$(echo $line | cut -d"," -f$i)
	    if [ -z "$temp" ];
	    then
		temp="null"
	    else
		isString=false
		if [[ $temp =~ ^[0-9]+$ ]];
		then
		    echo "is Number"
		else
		    echo "is String"
		    temp="'$temp'"
		fi
	    fi

	    querry="$querry$temp"

	    if [ $i -lt 25 ];
	    then
		querry="$querry,"
	    fi
	done

	querry="$querry);"
	echo $querry >> fileOutput.sql
    else
	first=$((first + 1))
    fi
    done

sqlite3 $database < fileOutput.sql
sqlite3 $database "SELECT * FROM SIX_Bankenstamm;"

echo "SUCCESS: imported"
