#!/bin/bash
Name=$1
if [ "$Name" = "Tux" ]; then
     echo "Hallo Pnguin"
else echo "Hallo $Name"
fi
exit 0