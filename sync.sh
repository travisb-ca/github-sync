#!/bin/bash

# Sync all the subdirectories.

for dir in */; do
	echo "Syncing $dir"
	cd $dir
	needs_push=0
	git svn fetch 2> /dev/null | grep '$' &> /dev/null
	if [ $? == 0 ]; then
		needs_push=1
	fi
	git svn rebase | grep "Current branch master is up to date" &>/dev/null
	if [ $? == 1 ]; then 
		needs_push=1
	fi

	if [ $needs_push == 1 ]; then
		echo "Pushing."
		#git push --tags origin master &> /dev/null
	fi
	cd ..
done
