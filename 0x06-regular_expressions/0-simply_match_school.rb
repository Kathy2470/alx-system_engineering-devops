#!/usr/bin/env ruby
# frozen_string_literal: true

input = ARGV[0]

regex = /School$/

matches = input.scan(regex).join

puts matches
