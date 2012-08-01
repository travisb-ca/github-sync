#!/bin/bash

# Sync all the subdirectories.

for dir in */; do
	echo "Syncing $dir"
	cd $dir
	git svn rebase | grep "Current branch master is up to date" &> /dev/null
	if [ $? == 1 ]; then
		git push --tags origin master &> /dev/null
	fi
	cd ..
done
