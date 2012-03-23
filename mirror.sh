#!/bin/bash

# Mirror a subversion subdirectory to github

if [ -z $3 ]; then
	echo "Usage: mirror.sh github_username name svnpath"
	exit "1"
fi

mkdir $2
cd $2
git init
git svn init --stdlayout $3
git svn fetch
git gc
git remote add origin git@githubmirror:$1/$2.git
git push origin master
