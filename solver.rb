#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'lib/board')

cards = []
ARGV.each do |arg|
  cards << Card.parse(arg)
end

raise "Incorrect number of cards you gave #{cards.size}, you need 12" unless cards.flatten.size % 3 == 0

board = Board.new(cards)

puts "=== BOARD ==="
board.cards.each do |card|
  puts card.describe
end

puts "\n=== SOLUTION ==="
board.solve.each do |c|
  puts c.collect {|card| card.describe}.join(" | ")
end
