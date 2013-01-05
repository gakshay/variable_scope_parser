#! /usr/bin/env ruby -wKU
# encoding: UTF-8

require File.dirname(__FILE__) + '/lib/hoppr.rb'


# File Read
parser = Hoppr::Parser.new
parser.file("sample/input_01.txt")


# Manual input 
parser = Hoppr::Parser.new
parser.input
