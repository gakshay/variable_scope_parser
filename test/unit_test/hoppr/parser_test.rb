require File.dirname(__FILE__) + '/../../test_helper'

# This is the test Class for Hoppr::Parser class
# containing unit test cases for the same.

class Hoppr::ParserTest < Test::Unit::TestCase
  
  def setup
    @parser = Hoppr::Parser.new
  end
  
  def test_file_not_found_error
    assert_raise Hoppr::FileError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/input.txt')
    end
  end
  
  def test_file_should_start_with_opening_bracket
    assert_nothing_raised Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/input_02.txt')
    end
    assert_raise Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/wrong_input_01.txt')
    end
  end
  
  def test_file_should_end_with_closing_bracket
    assert_nothing_raised Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/input_03.txt')
    end
    assert_raise Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/wrong_input_02.txt')
    end
  end
  
  def test_file_has_equal_number_of_brackets
    assert_nothing_raised Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/input_01.txt')
    end
    assert_raise Hoppr::BracketError do 
      @parser.file(File.dirname(__FILE__) + '/../../../sample/wrong_input_03.txt')
    end
  end
end