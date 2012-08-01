#!/bin/bash
# Copyright (C) 2012  Travis Brown
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 2 as published by the Free Software Foundation.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# Mirror a subversion subdirectory to github

if [ -z $3 ]; then
	echo "Usage: mirror.sh github_username name svnpath [-T]"
	echo "       Use -T when the svn location does not have trunk/tags/branches layout"
	exit "1"
fi

if [ "$4" == "-T" ]; then
	options=""
else
	options="--stdlayout"
fi

mkdir $2
cd $2
git init
git svn init $options $3
git svn fetch
git gc
git remote add origin git@githubmirror:$1/$2.git
git push --tags origin master
