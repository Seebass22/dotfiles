#!/bin/bash

lsof="$(lsof -Pi | grep ssh)"

sessions=$(echo -n $lsof | wc -l)
nr=$(echo $lsof | cut -d ">" -f 2 | cut -d ":" -f 1 | sort | uniq -c | wc -l)

if [ $sessions -eq 0 ] ; then
	echo ""	
else
	if [ $nr -lt 4 ] ; then
		for i in $(seq 1 $nr)
		do
			devices+=$(echo -n $lsof | cut -d ">" -f 2 | cut -d ":" -f 1 | uniq -c | sed -n "$i p" | sed 's/^[[:blank:]]*//')
			if [ $i -ne $nr ] ; then
				devices+=", "
			fi
		done
	fi
	echo "ssh sessions: $devices"
fi
