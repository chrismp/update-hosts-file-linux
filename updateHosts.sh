#!/bin/bash
# based on http://www.putorius.net/2012/01/block-unwanted-advertisements-on.html
HOSTS="/etc/hosts"
HOSTS_TXT="hosts.txt"
BACKUP="/etc/hostsBackup"
TEMP="hostsTemp"

cp $HOSTS $BACKUP 										 # make backup copy hosts file
wget http://winhelp2002.mvps.org/hosts.txt -O $HOSTS_TXT # download latest hosts content to local txt file
head -4 $HOSTS > $TEMP 									 # copy necessary top lines from local hosts file to temporary file
mv $TEMP $HOSTS 				 						 # rename temporary hosts file to `hosts`
tail -n +26 $HOSTS_TXT >> $HOSTS 						 # copy main content from hosts.txt file to `hosts` 
rm $HOSTS_TXT 											 # delete `hosts.txt`