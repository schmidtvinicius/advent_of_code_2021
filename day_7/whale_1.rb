# input = File.new('example.txt').read
input = File.new('input.txt').read

input = input.split(/,/).map(&:to_i).sort

median = input.size.odd? ? input[(input.size.to_f / 2.0).ceil] : (input[input.size/2 - 1] + input[input.size/2]) / 2

total_cost = 0

input.each do |number|
  total_cost += (number - median).abs
end

puts(total_cost)