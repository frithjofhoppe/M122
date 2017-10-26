#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Sie müssen zwei Dateinamen angeben"
    echo "Usage:Filecontrol.sh File1 Fil2"
else
    if [ -e $1 ] && [ -e $2 ]
    then
	echo "Die Datei $1 exisitert"
	echo "Die Datei $2 exisitiert"
    else
	echo "Die Dateien existieren nicht"
    fi
fi