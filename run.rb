#! /usr/bin/env ruby -wKU
# encoding: UTF-8

require File.dirname(__FILE__) + '/lib/hoppr.rb'

# send file path as argument

parser = Hoppr::Parser.new
result = ARGV[0] ? parser.file(ARGV[0]) : parser.input
puts result