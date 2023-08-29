#!/bin/bash

if [ -z "$1" ] ; then
	export GIT_PULL_EN=1
elif [ $1 = "dev" ] ; then
	export GIT_PULL_EN=1
	export DEV_NB=1
fi

if [ ${GIT_PULL_EN} = "1" ] ; then
	echo "Fetching latest from repo ..."
	cd ~/ML4ALL ; git pull || echo "git pull failed"
	echo "Done ..." ; echo ""
else 
	echo "Skipping git pull" ; echo ""
fi

if [ ${DEV_NB} = "1" ] ; then
	~/ML4ALL/dev_nb.sh
else
	~/ML4ALL/student_nb.sh
fi
