#!/bin/bash

SIZE_OPTIONS=( '16' '22' '24' '32' '48' '64' '128' '256' )
for i in ${SIZE_OPTIONS[@]}; do 
    DIRECTORY="/home/josh/builds/keepassx/share/icons/application/${i}x${i}/actions/"
    if [ ! -d $DIRECTORY ]; then mkdir $DIRECTORY; fi 
    echo $DIRECTORY
    for FILENAME in *; do
	echo $FILENAME
	echo ${FILENAME##*.}
	if [ ${FILENAME##*.} = "svg" ]; then
	    echo ${FILENAME##*.}
	    inkscape $FILENAME --export-png=$DIRECTORY${FILENAME%.svg}.png -w$i -h$i
	elif [ ${FILENAME##*.} = "svgz" ]; then
	    echo ${FILENAME##*.}
	    inkscape $FILENAME --export-png=$DIRECTORY${FILENAME%.svgz}.png -w$i -h$i
	fi
    done
done
