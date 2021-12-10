# input = File.new('example.txt').read
input = File.new('input.txt').read

input = input.split(/,/).map(&:to_i).sort

mean = input.sum / input.size

puts(mean)

total_cost = 0

input.each do |number|
  distance = (number - mean).abs
  total_cost += (1..distance).sum
end

puts(total_cost)