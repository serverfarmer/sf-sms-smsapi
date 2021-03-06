#!/bin/sh

file="/etc/local/.config/smsapi.credentials"

if [ ! -f $file ]; then
	if [ "$SMSAPI_USERNAME" = "" ]; then
		read -p "smsapi.pl username: " SMSAPI_USERNAME
		read -p "smsapi.pl password hash: " SMSAPI_PASSWORD
		read -p "smsapi.pl sender string: " SMSAPI_FROM
	fi

	echo "SMSAPI_USERNAME=\"$SMSAPI_USERNAME\"" >$file
	echo "SMSAPI_PASSWORD=\"$SMSAPI_PASSWORD\"" >>$file
	echo "SMSAPI_FROM=\"$SMSAPI_FROM\"" >>$file

	chmod 0600 $file
fi
