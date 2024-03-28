#!/bin/bash
#This script takes a URL as an argument, sends a GET request with a custom header, and displays the body of the response

# Sending GET request to the provided URL with a custom header and displaying the body of the response
curl -sH "X-School-User-Id: 98" "$1"
