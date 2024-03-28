#!/bin/bash
#This script takes a URL, sends a request using curl, and displays the size of the response body in bytes

# Sends a request to the provided URL, stores the response in a temporary file, extracts the content length, and displays it
curl -s "$1" -o temp.txt | grep -i "Content-Length" | awk '{print $2}'
