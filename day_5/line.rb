class Line
  attr_reader :x1, :x2, :y1, :y2
  
  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
  end

  def vertical?
    @x1 == @x2
  end

  def horizontal?
    @y1 == @y2
  end
end