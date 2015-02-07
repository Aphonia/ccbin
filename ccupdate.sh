#!/bin/bash

giturl=`cat svnurl.config|awk '{printf $0}' `
echo $giturl

git clone $giturl build
