#!/bin/bash

if [ -z "$1" ] ; then
	GIT_PULL_EN=1
	DEV_NB=0
elif [ $1 = "dev" ] ; then
	DEV_NB=1
	if [ -z "$2" && $2 = "nogit" ] ; then
		GIT_PULL_EN=0
	else
		GIT_PULL_EN=1
	fi
elif [ $1 = "nogit" ] ; then
	GIT_PULL_EN=0
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
