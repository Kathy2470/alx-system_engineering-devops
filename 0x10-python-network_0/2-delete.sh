#!/bin/bash
#This script sends a DELETE request to the URL passed as the first argument and displays the body of the response

# Sending DELETE request to the provided URL and displaying the body of the response
curl -sX DELETE "$1"
