#!/bin/bash

# Script to test status of a service.

MYFILE=/tmp/status
STATUS=$(service postfix status | grep Active | awk '{print $2}')


# Remove any old files before starting.

# echo "Checking for the existence of the old file before beginning"
if [ -f $MYFILE ]
	then
	echo $MYFILE exists.
	echo Removing old file.
	rm $MYFILE
	echo Continuing....
fi


# Check current status of the Postfix status
#echo $STATUS > $MFILE
#service postfix status | grep Active | awk '{print $2}' > $MYFILE
systemctl status postfix.service | grep Active | awk '{print $2}' > $MYFILE

STATUS=$(cat $MYFILE) 
if [ $STATUS = "active" ]; then
	echo Postfix is $STATUS
#	echo do something with logrote 
elif [ $STATUS = "inactive" ]; then
	echo Postfix is $STATUS
	echo You should restart it
fi


#if $STATUS='inactive'
#	echo 'Service is not running'
#else
#	if $STATUS='running'
#	echo 'Service is running'
#	fi
#fi
