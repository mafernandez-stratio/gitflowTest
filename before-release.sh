#!/bin/bash
# Before Stratio Deep new release script

echo " >>> BEFORE STRATIO DEEP NEW RELEASE SCRIPT <<< "

if [ -z "$1" ]; then
	echo "Usage: $0 version"
	exit 0
fi

#### Remove folder used as a copy in the previous deployment

echo " >>> Removing gitflowMock folder"

rm -rf ../gitflowMock/

#### Delete remote branch 

echo " >>> Deleting remote branch"

git push origin --delete release-$1

#### Delete local branch

echo " >>> Deleting local branch"

git checkout develop

git branch -d release-$1

echo " >>> SCRIPT SUCCESSFULLY EXECUTED <<< "
