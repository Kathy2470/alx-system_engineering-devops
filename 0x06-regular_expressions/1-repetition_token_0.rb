#!/usr/bin/env ruby
# frozen_string_literal: true

input = ARGV[0]

regex = /School$/

matches = regex.match(input)

if matches
  puts matches[0]
else
  puts 'No match found'
end
