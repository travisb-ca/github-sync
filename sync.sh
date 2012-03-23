#!/bin/bash

# Sync all the subdirectories.

for dir in */; do
	echo "Syncing $dir"
	cd $dir
	git svn rebase &> /dev/null
	git push origin master &> /dev/null
	cd ..
done
