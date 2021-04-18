#!/bin/bash

cd $HOME/duckdns_duc

check="FAIL"

while [[ $check != "OK" ]]
do
    check=$(echo url="https://www.duckdns.org/update?domains=spasoye&token=5dec56a1-ddb0-4c7b-bda1-5d22ca1cc6d0&ip=" | curl -k -K -)

    sleep 5

    if [[ $check == "OK" ]]
    then
	    echo "PASS"
        msg="PASS"
    else	
        echo "FAIL"
        msg="FAIL"
    fi

    # Log the output and the timestamp
    echo "`{ date +"%D %T"; echo $msg; } | tr "\n" " "`"
done

if [ "$check" == "OK" ]; then
    exit 0
else
    exit 1
fi
