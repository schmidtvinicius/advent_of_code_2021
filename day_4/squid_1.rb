require_relative 'board'
require 'colorize'

BOARD_SIZE = 5.freeze

# input = File.new('example.txt').read
input = File.new('input.txt').read

input = input.split(/\n/)

input.delete_if { |element| element.strip.empty? }

numbers_to_draw = input.delete_at(0)
numbers_to_draw = numbers_to_draw.split(/,/).map(&:to_i)

boards = []

(0..input.size-1).step(BOARD_SIZE) do |i|
  boards << Board.new(input.slice(i,BOARD_SIZE))
end

bingo = false
drawn_number = 0

while !bingo && drawn_number < numbers_to_draw.size do
  number = numbers_to_draw[drawn_number]
  puts("Drawing number #{number}")
  boards.each do |board|
    board.mark_number(number)
    if board.bingo?
      puts("Winning board is:\n#{board.to_s}")
      puts("The score is: #{board.score(number)}")
      bingo = true
      break
    end
  end
  drawn_number += 1
end