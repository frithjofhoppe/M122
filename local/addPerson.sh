#!/bin/bash
echo "Geben sie ihren Vor- und NAchnamen ein"
read vorname nachname
while true;do
if [ "$name" = "quit" ];then
    echo "Programm wird beenden"
    break
else
    echo $vorname $nachname  >> output
    echo "Bitte geben sie einen namen und vornamen ein"
    read vorname nachname
fi
done
