#!/bin/bash

# Mirror a subversion subdirectory to github

if [ -z $2 ]; then
	echo "Usage: mirror.sh name svnpath"
	exit "1"
fi

mkdir $1
cd $1
git init
git svn init --stdlayout $2
git svn fetch
git gc
git remote add origin git@githubmirror:travisb-ca/$1.git
git push origin master
