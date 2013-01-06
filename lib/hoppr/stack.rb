#!/usr/bin/env ruby -wKU
# encoding: UTF-8

module Hoppr
  
  # Stack stores the updated latest value on top of the stack
  # Top of the stack inherits the variable values from the last stack
  # Provides standard function like push, pop, find, update, reset, size, first, last, each
  class Stack
    attr_accessor :top, :list
  
    # Initializes a stack of +empty+ array
    # The value of +top+ for an empty stack is +0+
    def initialize
      @list, @top = [], nil
    end
  
    # Find the value from top level of the stack
    def find(key)
      @list[@top][key.to_sym]
    end
  
    # update the value for the key on top of the stack
    def update(key, value)
      @list[@top][key.to_sym] = value.is_a?(Integer) ? value : find(value) unless empty?
    end
  
    # Increments top and inserts the duplicate values on top of the stack
    def push
      if @top.nil?
        @top = 0
        @list[@top] = {}
      else
        @top += 1
        @list[@top] = @list[@top - 1].dup
      end
    end
  
    # Deletes the values on top of the stack and decreases top
    def pop
      @list.delete_at(@top)
      @top -= 1
      reset if empty?
    end
  
    # Returns +true+ if the stack is empty
    def empty?
      @top.nil? || @top < 0
    end
  
    # Resets the stack
    def reset
      @list, @top = [], nil
    end
    alias_method :reset!, :reset

    def size
      @list.size
    end
    alias_method :length, :size
    
    def first
      @list.first
    end

    def last
      @list[@top]
    end

    def each
      @list.each do
        yield
      end
    end
    
  end # class Stack
end # module Hoppr