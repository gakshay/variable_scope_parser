require File.dirname(__FILE__) + '/../../test_helper'

# This is the test Class for Hoppr::Stack class
# containing unit test cases for the same.

class Hoppr::StackTest < Test::Unit::TestCase
  
  def setup
    @stack = Hoppr::Stack.new
  end
  
  def test_initiazed_stack_is_empty
    empty_stack_assertions
  end
  
  def test_stack_dont_update_before_pushing_anything
    @stack.update('a', 10)
    empty_stack_assertions
  end
  
  def test_stack_push
    @stack.reset!
    @stack.push
    assert_equal(@stack.top, 0)
    assert_equal(@stack.length, 1)
    @stack.push
    assert_equal(@stack.top, 1)
    assert_equal(@stack.length, 2)
    @stack.reset!
  end
  
  def test_stack_pop
    @stack.reset!
    @stack.push
    @stack.push
    @stack.push
    assert_equal(@stack.top, 2)
    assert_equal(@stack.length, 3)
    @stack.pop
    assert_equal(@stack.top, 1)
    assert_equal(@stack.length, 2)
    @stack.pop
    assert_equal(@stack.top, 0)
    assert_equal(@stack.length, 1)
    @stack.pop
    empty_stack_assertions
    @stack.reset!
  end
  
  def test_only_in_scope_variables_get_updated
    @stack.reset!
    @stack.push
    @stack.update('a', 10)
    @stack.update('b', 20)
    assert_equal(@stack.find('a'), 10)
    assert_equal(@stack.find('b'), 20)
    @stack.push
    @stack.update('a', 50)
    assert_equal(@stack.find('a'), 50)
    assert_not_equal(@stack.find('a'), 10)
    assert_equal(@stack.find('b'), 20)
    @stack.push
    @stack.update('b','a')
    @stack.update('a', 15)
    assert_equal(@stack.find('a'), 15)
    assert_equal(@stack.find('b'), 50)
    assert_not_equal(@stack.find('b'), 20)
    assert_not_equal(@stack.find('a'), 50)
    @stack.pop
    assert_equal(@stack.find('b'), 20)
    assert_not_equal(@stack.find('a'), 10)
    @stack.pop
    @stack.reset!
  end
  
  def test_stack_is_resetable
    @stack.reset
    empty_stack_assertions
  end
  
  private
  
  def empty_stack_assertions
    assert_equal(@stack.empty?, true)
    assert_equal(@stack.top, nil)
    assert_equal(@stack.length, 0)
  end
  
end