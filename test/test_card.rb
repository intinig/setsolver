require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/card.rb')

class TestBoard < Test::Unit::TestCase
  def test_should_initialize_random
    assert Card.new.describe
  end
  
  def test_should_describe_correctly
    c = Card.new(:color => 0, :shape => 0, :shading => 0, :number => 2)
    assert_equal "2 Solid Green Oval(s)", c.describe
  end
  
  def test_parse
    assert_equal "2 Solid Green Oval(s)", Card.parse('2sgo').describe
  end
end