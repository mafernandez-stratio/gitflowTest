#!/bin/bash

echo " >>> Mock script with parameters: $1 and $2"

mkdir -p repository

if [ -z "$1" ]; then
	echo "Usage: $0 --tgz version"
	exit 0
fi

if [ -z "$2" ]; then
	echo "Usage: $0 --tgz version"
	exit 0
fi

if [ "--tgz" == "$1" ]; then
	tar czf repository/release-$2.tgz *.data
	echo " >>> release-$2.tgz created"
else
	" >>> No operation"
fi

