#!/bin/bash

cd /home/ivan/duckdns

check=$(echo url="https://www.duckdns.org/update?domains=spasoye&token=5dec56a1-ddb0-4c7b-bda1-5d22ca1cc6d0&ip=" | curl -k -K -)

# echo $check

if [ $check == "OK" ]
then
    msg="PASS"
else
    msg="FAIL"
fi

echo $msg

# Log the output and the timestamp
echo "`{ date +"%D %T"; echo $msg; } | tr "\n" " "`" >> duck.log

if [ "$check" == "OK" ]; then
    exit 0
else
    exit 1
fi