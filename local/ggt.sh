#!/bin/bash
#Skritp ggt.sh

#List mittels $ zwei parameter ein und weist sie a und b zu
a=$1
b=$2

# Druch die While-Schlaufe wird ermittelt wann die division von a und b null ist
# ! negiert den Ausdruck
# [] stellt den Ausdruck da der geprueft wird
# $(()) interpretiert den Audrucl als mathematische Operation
# innerhalb diese Konstrukt wird kein $ benötigt um die Werte zu vergleichen

while ! [ $((a%b)) = 0 ];
do
    #die var temp wrid der Wert von a mittels $  zugewiesen
    temp=$a
    a=$b
    b=$((temp%b))
    # done markiert das Ende der While-Schalufe
done

echo "Der GGT der beiden Zahlen lautet $b"



