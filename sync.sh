#!/bin/bash

# Sync all the subdirectories.

for dir in */; do
	echo "Syncing $dir"
	cd $dir
	git svn fetch | grep '$' &> /dev/null
	if [ $? == 0 ]; then
		git push --tags origin master &> /dev/null
	fi
	cd ..
done
