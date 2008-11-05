require File.join(File.dirname(__FILE__), 'array_extensions')
require File.join(File.dirname(__FILE__), 'card')

class Board
  attr_reader :cards
  
  def initialize(*cards)
    raise "Incorrect number of cards you gave #{cards.size}, you need 12" unless cards.flatten.size % 3 == 0
    @cards = cards.flatten
  end
  
  def solve
    solutions = []
    @cards.combinations_without_repetitions(3).each do |combination|
      solutions << combination if solution?(combination)
    end
    solutions
  end
  
  private
  def solution?(combination)
    color?(combination) && shape?(combination) && shading?(combination) && number?(combination)
  end
  
  def color?(c)
    check_attribute(c, :color)
  end
  
  def shape?(c)
    check_attribute(c, :shape)
  end
  
  def shading?(c)
    check_attribute(c, :shading)
  end
  
  def number?(c)
    check_attribute(c, :number)
  end
    
  def check_attribute(c, attribute)
    filtered = c.collect {|card| card.send(attribute)}
    (filtered.uniq == filtered) || (filtered.uniq.size == 1)
  end
end
