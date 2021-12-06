require_relative 'line'

# input = File.new('example.txt').read
input = File.new('input.txt').read

input = input.split(/\n/)

lines = []

largest_x = 0
largest_y = 0

input.each do |pair|
  coordinates = pair.gsub(/->\s/, "").split(/\s|,/)
  coordinates.map!(&:to_i)
  next if coordinates[0] != coordinates[2] && coordinates[1] != coordinates[3]
  max_x = [coordinates[0], coordinates[2]].max
  largest_x =  max_x > largest_x ? max_x : largest_x
  max_y = [coordinates[1], coordinates[3]].max
  largest_y = max_y > largest_y ? max_y : largest_y 
  lines << Line.new(*coordinates)
end

plain = Array.new(largest_x+1) { Array.new(largest_y+1, 0) }

lines.each do |line|
  if line.vertical?
    minmax = [line.y1, line.y2].minmax
    (minmax[0]..minmax[1]).each do |y|
      plain[line.x1][y] += 1
    end
  else
    minmax = [line.x1, line.x2].minmax
    (minmax[0]..minmax[1]).each do |x|
      plain[x][line.y1] += 1
    end
  end
end

more_than_two_overlaps = 0

plain.each do |row|
  row.each do |point|
    more_than_two_overlaps += 1 if point > 1
  end
end

puts("Answer: #{more_than_two_overlaps}")