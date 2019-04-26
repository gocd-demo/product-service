#!/bin/bash

NUMBER_OF_COMMITS=30
SLEEP_TIME=300

for i in `seq 1 $NUMBER_OF_COMMITS`;
do
	echo "This is a new line $i" >> demo_trigger_file.txt
	git commit -am "`fortune`"
        git push
	sleep $SLEEP_TIME
done
