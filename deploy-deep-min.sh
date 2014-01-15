#!/bin/bash
# Stratio Deep Deployment script

echo " >>> STRATIO DEEP DEPLOYMENT <<< "

if [ -z "$1" ]; then
	echo "Usage: $0 version"
	exit 0
fi

#### Using git-flow to create a new release branch

git checkout develop

git add *

git commit -m "Commit before creating release $1"

echo " >>> Creating git release $1"

git checkout -b release-$1 develop

echo " >>> Bumping version to $1"

grep -rl " * @version *.*" . --exclude=deploy-deep.sh | xargs sed -i "s/ \* @version *.*/ \* @version $1/g"

echo " >>> Commiting release $1"

##git add *

git commit -m "Bumped version number to $1"

echo " >>> Uploading new release branch to remote repository"

git push https://github.com/miguel0afd/gitflowTest.git release-$1:release-$1

#### Downloading the new branch

##echo " >>> Downloading the new branch"

##git clone https://github.com/miguel0afd/gitflowTest.git -b release-$1 ../gitflowMock

#### Executing make distribution script

##cd ../gitflowMock

##echo " >>> Executing make distribution script"

##./mock-script.sh --tgz "$1"

#### Uploading the tgz file to a remote repository

##echo " >>> Uploading the tgz file to a remote repository"

##git add repository/release-$1.tgz

##git commit -m "tgz file added"

##git push https://github.com/miguel0afd/gitflowTest.git release-$1:release-$1

##echo " >>> Finishing"

##cd ../gitflowTest

echo " >>> SCRIPT SUCCESSFULLY EXECUTED <<< "
