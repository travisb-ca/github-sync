#!/bin/bash

# Sync all the subdirectories.

for dir in */; do
	cd $dir
	git svn rebase
	git push origin master
	cd ..
done
