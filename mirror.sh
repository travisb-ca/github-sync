#!/bin/bash

# Mirror a subversion subdirectory to github

if [ -z $3 ]; then
	echo "Usage: mirror.sh github_username name svnpath [-T]"
	echo "       Use -T when the svn location does not have trunk/tags/branches layout"
	exit "1"
fi

if [ "$4" == "-T" ]; then
	options = ""
else
	options = "--stdlayout"
fi

mkdir $2
cd $2
git init
git svn init $options $3
git svn fetch
git gc
git remote add origin git@githubmirror:$1/$2.git
git push origin master
