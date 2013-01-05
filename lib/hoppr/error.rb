#!/usr/bin/env ruby -wKU
# encoding: UTF-8

module Hoppr
  
  # Custom File errors are handled here
  class FileError < StandardError; end
  
  # Bracket mismatch errors are handled here
  class BracketError < StandardError; end
end
