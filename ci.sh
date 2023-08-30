#! /bin/bash

while true; do

    inotifywait -m -e modify content | ./build.sh

done
