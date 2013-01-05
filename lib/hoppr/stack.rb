#!/usr/bin/env ruby -wKU
# encoding: UTF-8

module Hoppr
  
  # Stack stores the updated latest value on top of the stack
  # Provides standard function like push, pop, find, update, reset, size, first, last, each
  class Stack
    attr_accessor :top, :list
  
    # Initializes a stack of +empty+ array
    # The value of +top+ for an empty stack is +0+
    def initialize
      set
    end
  
    def set
      @list, @top = [], nil
    end
  
    # Find the value from top level of the stack
    def find(key)
      @list[@top][key.to_sym]
    end
  
    # update the value for the key on top of the stack
    def update(key, value)
      @list[@top][key.to_sym] = value.is_a?(Integer) ? value : find(value)
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
      #empty? ? reset : (@top -= 1 )
    end
  
    # Returns +true+ if the stack is empty
    def empty?
      @top.nil? || @top <= 0
    end
  
    # Resets the stack
    def reset
      set
    end
    alias_method :reset!, :reset

    def size
      @list.size
    end

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
    
  end
end