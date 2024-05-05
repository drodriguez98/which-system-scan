#!/bin/bash

host=$1

echo "Starting analysis at $host"

ping -c 1 $host > ping.log

for i in $(seq 60 70); do

    if test $(grep ttl=$i ping.log -c) = 1; then

        echo "$1 is a Linux machine"

    fi

done

for i in $(seq 100 150); do

    if test $(grep ttl=$i ping.log -c) = 1; then

        echo "$1 is a Windows machine"

    fi

done

rm ping.log