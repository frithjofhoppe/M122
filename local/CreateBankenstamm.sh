#!/bin/bash


database="$PWD/SIX_Bankenstamm.db"
first=0
sqlite3 $database <<EOF
DROP TABLE SIX_Bankenstamm;
CREATE TABLE SIX_Bankenstamm ('Sort-Nr.' INTEGER PRIMARY KEY, BCNr INTEGER, 'TEIL. IBAN-Tool' INTEGER,'PZ Validierung' INTEGER, 'BCNR IID' INTEGER, Landcode TEXT, 'Postkonto in' TEXT,'Postkonto out' TEXT, SWIFT TEXT, 'Emailadresse Entwickler' TEXT, Mutationsdatum TEXT, Hauptsitz INTEGER, 'BC-Art' INTEGER, 'Bank / Institut' TEXT, SIC INTEGER, 'euro-sic' INTEGER, Sprache INTEGER, 'Kurz.bez.' TEXT, Domizil TEXT, Postadresse TEXT, PLZ INTEGER, Ort TEXT, Telefon TEXT, Fax TEXT, Vorwahl INTEGER);
EOF

"" > fileOutput

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
		if [[ $temp = *[[:digit:]]* ]];
		then
		    echo ">> Number <<"
		else
		    rand="'"
		    if [ $isString = false ];
		    then
			temp="$rand$temp$rand"
			isString=true
		    fi
		    echo " >> String <<"
		fi
	    fi

	    querry="$querry$temp"

	    if [ $i -lt 25 ];
	    then
		querry="$querry,"
	    fi
	done

	querry="$querry)"
	echo $querry >> fileOutput
	sqlite3 $database $querry

#	sortNr=$(echo $line | cut -d";" -f1)
#	entry[]
#	bcnr=$(echo $line | cut -d";" -f2)
#	teilIBANTool=$(echo $line | cut -d";" -f3)
#	pzValidierung=$(echo $line | cut -d";" -f4)
#	bcnrIID=$(echo $line | cut -d";" -f5)
#	landcode=$(echo $line | cut -d";" -f6)
#	postkontoIn=$(echo $line | cut -d";" -f7)
#	postkontoOut=$(echo $line | cut -d";" -f8)
#	swift=$(echo $line | cut -d";" -f9)
#	mailDev=$(echo $line | cut -d";" -f10)
#	mutationsdatum=$(echo $line | cut -d";" -f11)
#	hauptsitz=$(echo $line | cut -d";" -f12)
#	bcArt=$(echo $line | cut -d";" -f13)
#	bankInstitut=$(echo $line | cut -d";" -f14)
#	sic=$(echo $line | cut -d";" -f15)
#	uroSic=$(echo $line | cut -d";" -f16)
#	sprache=$(echo $line | cut -d";" -f17)
#	kurzBez=$(echo $line | cut -d";" -f18)
#	domizil=$(echo $line | cut -d";" -f19)
#	postadresse=$(echo $line | cut -d";" -f20)
#	plz=$(echo $line | cut -d";" -f21)
#	ort=$(echo $line | cut -d";" -f22)
#	telefon=$(echo $line | cut -d";" -f23)
#	fax=$(echo $line | cut -d";" -f24)
#	vorwahl=$(echo $line | cut -d";" -f25)
#	sqlite3 $database "INSERT INTO SIX_Bankenstamm VALUES($sortNr,$bcnr,$teilIBANTool,$pzValidierung);"
	#sqlite3 $database "INSERT INTO SIX_Bankenstamm VALUES($sortNr,$bcnr,$teilIBANTool,$pzValidierung,$brnrIID,'$landcode','$postkontoIn','$postkontoOut','$swift','$mailDev','$mutationsdatum',$hauptsitz,$brArt,'$bankInstitut',$sic,$euroSic,$sprache,'$kurzBez','$domizil','$postadresse',$plz,'$ort','$telefon','$fax',$vorwahl);"
    else
	first=$((first + 1))
    fi
    done


sqlite3 $database "SELECT * FROM SIX_Bankenstamm;"

echo "SUCCESS: imported"