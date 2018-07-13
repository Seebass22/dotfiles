#!/bin/bash
city='Berlin'

update=0
if [ "$(( $(date +"%s") - $(stat -c "%Y" /tmp/weatherfile) ))" -gt "7200" ]; then
	update=1
fi

if [ ! -f /tmp/weatherfile ] || [ $update -eq 1 ] ; then
	curl -s wttr.in/$city > /tmp/weatherfile
fi

cat /tmp/weatherfile | grep ° > /dev/null
if [ $? -eq 0 ] ; then
	echo "$city: $(cat /tmp/weatherfile | grep ° | head -n 1 | awk '{print $(NF - 1) $NF}' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")"
else
	echo ""
fi
