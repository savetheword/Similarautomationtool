#!/bin/bash

if [ -z "$1" ]
then
        echo "Usage: ./recon.sh <IP>"
        exit 1
fi

printf "\n----- NMAP -----\n\n" > results

echo "Similar Nmap..."
nmap $1 | tail -n +5 | head -n -3 >> results


if [ -e temp1 ]
then
        printf "\n----- Similar DIRS -----\n\n" >> results
        cat temp1 >> results
        rm temp1
fi

if [ -e temp2 ]
then
    printf "\n----- Similar WEB -----\n\n" >> results
        cat temp2 >> results
        rm temp2
fi

cat results
