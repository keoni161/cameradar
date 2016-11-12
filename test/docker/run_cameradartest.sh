#!/bin/bash

while ! mysqladmin ping -h"cameradar-database" -P3306 --silent; do
    sleep 1
done

cat /tmp/tests/cameradartest.conf.json

# build
go build

cp /tmp/tests/*.xml ./

# run test
./cameradartest /tmp/tests/cameradartest.conf.json

cat *.xml

cp *.xml /tmp/tests/
