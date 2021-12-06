require 'colorize'

class Place
  attr_reader :number
  attr_reader :is_marked

  def initialize(number)
    @number = number
    @is_marked = false
  end

  def mark_place
    @is_marked = true
  end

  def to_s
    string = ""
    string << "\s" if number.to_s.match(/^\d$/)
    return string.concat(number.to_s.colorize(:green)) if @is_marked
    string.concat(number.to_s)
  end
end