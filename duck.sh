#!/bin/bash

cd $HOME/duckdns_duc

check="FAIL"

if [ $# -ne 2 ]; then
    echo "Need hostname and token arguments"
    exit 1
fi

while [[ $check != "OK" ]]
do
    check=$(echo url="https://www.duckdns.org/update?domains=$1&token=$2&ip=" | curl -k -K -)

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
