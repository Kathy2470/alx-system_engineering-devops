#!/usr/bin/env ruby

input = ARGV[0]

regex = /School$/

matches = input.scan(regex).join

puts matches
