#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require File.dirname(__FILE__) + '/stack.rb'
require File.dirname(__FILE__) + '/error.rb'

module Hoppr
  
  # Parser class that reads the user STDIN to parse the input sequence
  # It also reads, parse a given file for the given sequence
  class Parser
    attr_accessor :sequence, :result
    
    def initialize
      @sequence = []
      @result = []
    end
    
    # takes user input from STDIN
    def input
      start
      while @stack.length != 0
        parse_line gets.chomp
      end
      @sequence.clear
      output
    end
    alias_method :run, :input
    
    def start
      puts "Enter the Parsing Sequence"
      @stack = Hoppr::Stack.new
      @sequence << gets.chomp
      raise Hoppr::BracketError, "File should start with '['" unless start_bracket
      @stack.push
    end
    
    # Parser on a given file
    def file(file)
      read_file(file)
      parse
      output
    end
    
    # read given file
    def read_file(file)
      File.open(file, "r") do |fd|
        while (line = fd.gets)
          @sequence << "#{line.chomp}"
        end
      end
    rescue StandardError => err
      raise Hoppr::FileError, "#{err}"
    end
    
    # parse each line of file
    def parse
      check_brackets
      @stack = Hoppr::Stack.new
      @sequence.each do |line|
        parse_line(line)
      end
      @sequence.clear
    end
    
    # parse each line from file or STDIN
    def parse_line(line)
      key, value = line.split(/\s+/)
      case line
      when /^\[$/
        @stack.push
      when /^\]$/
        @stack.pop
      when /^(print)(\s+)(.*)$/
        value = @stack.find(value)
        value.nil? ? @result << 0 : result << value
      when /^(\w+)(\s+)(\d+)$/
        @stack.update(key, Integer(value))
      when /^(\w+)(\s+)(\w+)$/
        @stack.update(key, value)
      else
        puts "Can't parse line: #{line}"
      end
    end
    
    def output
      @result.join("\n")
    end
    
    private 
    
    # check brackets on given file 
    def check_brackets
      brackets_symmetry
      start_end_symmetry
    end
    
    def brackets_symmetry
      raise Hoppr::BracketError, "Brackets [  ] don't match" unless count_opening_brackets == count_closing_brackets
    end
    
    def start_end_symmetry
      raise Hoppr::BracketError, "File should start with '[' and end with ']'" unless (start_bracket && end_bracket)
    end
    
    def count_opening_brackets
      @sequence.count("[")
    end
    
    def count_closing_brackets
      @sequence.count("]")
    end
    
    def start_bracket
      @sequence.first == "["
    end
    
    def end_bracket
      @sequence.last == "]"
    end
  end
end
