[<0;39;19Mmore 'SIX_BankenstammCH.csv' | while read line
    do
	for i in {1..5}; do
	    echo $(echo $line | cut -d";" -f$i)
	done
    done

    echo "Finish"