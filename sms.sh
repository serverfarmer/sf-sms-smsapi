#!/bin/sh

file="/etc/local/.config/smsapi.credentials"
url="https://ssl.smsapi.pl/sms.do"

if [ "$2" = "" ]; then
	echo "usage: $0 <number> <message>"
	exit 1
elif [ ! -f $file ]; then
	echo "error: $file file not found, cannot authorize"
	exit 1
fi

. $file

if [ "$SMSAPI_USERNAME" != "" ]; then
	curl -sS -d "encoding=utf8&eco=0&username=$SMSAPI_USERNAME&password=$SMSAPI_PASSWORD" -d "to=$1" --data-urlencode "from=$SMSAPI_FROM" --data-urlencode "message=$2" $url
fi
