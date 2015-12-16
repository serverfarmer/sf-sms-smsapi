#!/bin/bash
. /opt/farm/scripts/init
. /opt/farm/scripts/functions.dialog
. /opt/farm/scripts/functions.install


file="/etc/local/.config/smsapi.credentials"

if [ ! -f $file ]; then
	read -p "smsapi.pl username: " USERNAME
	read -p "smsapi.pl password hash: " PASSWORD
	read -p "smsapi.pl sender string: " FROM

	echo "SMSAPI_USERNAME=\"$USERNAME\"" >$file
	echo "SMSAPI_PASSWORD=\"$PASSWORD\"" >>$file
	echo "SMSAPI_FROM=\"$FROM\"" >>$file

	chmod 0600 $file
fi

if [ ! -f /usr/local/bin/sf-sms ]; then
	ln -s /opt/sf-sms-smsapi/sms.sh /usr/local/bin/sf-sms
fi
