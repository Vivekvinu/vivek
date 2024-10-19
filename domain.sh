#!/bin/bash
domain=$1
mkdir -p output/$domain
echo "Start Assetfinder"
assetfinder --subs-only $domain > output/$domain/assetfinder.txt
echo "Finished Assetfinder"
echo "Started Sublister"
sublist3r -d $domain -o output/$domain/sublister.txt
echo "Finished and started Sorting"
cat output/$domain/assetfinder.txt output/$domain/sublister.txt | sort -u > output/$domain/all_subdomains.txt
echo "Finding all Live Subdomains"
cat output/$domain/all_subdomains.txt | httprobe > output/$domains/live_subdomains txt
echo "Finished"
