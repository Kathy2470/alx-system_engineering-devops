#!/bin/bash

curl -sI "$1" -o temp.txt

grep -i "Content-Length" temp.txt | awk '{print $2}'

rm temp.txt
