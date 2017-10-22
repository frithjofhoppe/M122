$(echo cat /etc/passwd) > testFile
$(echo cat /etc/passwd) | while read line
do
    echo "1: $(echo $line | cut -d":" -f1)"
    echo "2: $(echo $line | cut -d":" -f2)"
done
rm testFile

echo "lines read"
