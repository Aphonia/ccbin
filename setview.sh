#!/bin/bash
echo "please set git url"
read svnUrl
if [ "$svnUrl" == "" ]; then
		echo -e "git url is null\n"
		exit 0
fi
echo $svnUrl>svnurl.config

sudo rm -rf build/*