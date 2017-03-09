#!/bin/bash

if [  -d "build" ]; then
        cd build && git pull
else
        giturl=`cat svnurl.config|awk '{printf $0}' `
        echo $giturl

        git clone $giturl build
fi
