#!/usr/bin/bash
#This script sends a GET request to a URL and displays the body of the response if the status code is 200

curl -s "$1" | if grep -q "200"; then cat; fi
