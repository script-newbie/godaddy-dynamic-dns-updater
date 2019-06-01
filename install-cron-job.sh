#!/bin/bash

script="$(pwd)/dns-updater.sh"
logger="$(pwd)/log.txt"
crontab -l | { cat; echo "* * * * * $script" >> $logger ; } | crontab -