#!/bin/bash

read -p "Path of your project : " raw_path
path=${raw_path/"~"/$HOME}
if [ ! -d "$path" ] || [ ! -d "$path/.git" ] ; then
	Echo 'The specified directory does not exist or is not a git repository.' 1>&2
	exit 1
elif [ ! -d $path/.git/hooks ] ; then
	echo 'The git repository does not contain any hooks folder.' 1>&2
	exit 1
elif [ -f $path/.git/hooks/pre-commit ] ; then 
	echo 'There is already a pre-commit hook.' 1>&2
	exit 1
else
	echo 'Deploy in progress 🚀  ...'
	cp pre-commit "$path/.git/hooks/"
	echo 'Done !'
fi



