require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/board.rb')

class TestBoard < Test::Unit::TestCase
  def setup
    @board = Board.new(Array.new(12) {Card.new})
  end

  def test_check_attribute
    assert @board.send(:check_attribute, [(c = Card.new), c, c], :color)
    assert @board.send(:check_attribute, [Card.new(:color => 0), Card.new(:color => 1), Card.new(:color => 2)], :color)
    assert ! @board.send(:check_attribute, [Card.new(:color => 0), Card.new(:color => 0), Card.new(:color => 2)], :color)
  end
end