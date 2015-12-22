#!/bin/bash

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

if [ ! -f /usr/local/bin/sf-sms ]; then
	ln -s /opt/sf-sms-smsapi/sms.sh /usr/local/bin/sf-sms
fi
