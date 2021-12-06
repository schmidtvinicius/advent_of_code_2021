require_relative 'place'
require 'pry'
require 'colorize'

class Board
  attr_reader :board

  def initialize(board)
    @numbers = {}
    @board = board.map do |row| 
      row.strip.split(/[\s]+/).map do |number|
        place = Place.new(number.to_i)
        @numbers[number.to_i] = place
        place
      end
    end
  end

  def mark_number(number)
    return unless @numbers.include? number
    @board.each do |row|
      row.each do |place|
        place.mark_place if place.number == number
      end
    end
  end

  def bingo?
    bingo = false
    @board.each do |row|
      bingo = row.all?(&:is_marked)
      break if bingo
    end
    unless bingo
      @board.each_index do |i|
        column = (0..@board.size-1).map { |row| @board[row][i] }
        bingo = column.all?(&:is_marked)
        break if bingo
      end
    end
    bingo
  end

  def score(number)
    @numbers.select {|k, v| !v.is_marked}.keys.sum * number
  end

  def to_s
    string = ""
    @board.each do |row|
      string = string << row.map(&:to_s).join("\s").concat("\n")
    end
    string
  end
end
