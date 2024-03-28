#!/bin/bash
#This script takes a URL, sends a POST request with parameters, and displays the body of the response

# Sending POST request to the provided URL with parameters and displaying the body of the response
curl -sX POST "$1" -d "email=test@gmail.com&subject=I will always be here for PLD"
