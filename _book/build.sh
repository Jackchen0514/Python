#!/bin/bash

echo "#############################################"
echo "***************gitbook build*****************"

gitbook build

echo "**********cp -r _book/* ../book/*************"
echo "                                             "

cp -r _book/* ../python_book/

echo "****************./git_push.sh****************"
./git_push.sh

echo "****************successful*******************"
echo "#############################################"
