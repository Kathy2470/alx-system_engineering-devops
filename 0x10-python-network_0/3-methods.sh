#!/bin/bash
#This script takes a URL and displays all HTTP methods the server will accept

# Sending an OPTIONS request to the provided URL and displaying the allowed HTTP methods
curl -sI -X OPTIONS "$1" | grep "Allow:" | cut -d " " -f 2-
