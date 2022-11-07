#!/bin/bash

pids=$(ps -ef | grep -v grep | grep testCI | awk '{print $2}')

for pid in $pids;
    do
        kill -9 "$pid"
        echo "kill $pid ok"
    done