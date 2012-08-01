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

	# Convert any tag branches into real git tags
	/usr/libexec/git-core/git-for-each-ref refs/remotes/tags | cut -d / -f 4- |
	while read ref; do
		git tag -a "$ref" -m"Convert git-svn branch-tag into real tag"  "refs/remotes/tags/$ref" &>/dev/null
	done

	if [ $needs_push == 1 ]; then
		git push --tags origin master &> /dev/null
	fi
	cd ..
done
