input = File.new('input.txt').read.split(/\n/)
# input = File.new('example.txt').read.split(/\n/)

individual_size = input[0].size

most_recurring = Array.new(individual_size, 0)

input.each do |bin|
  (0..individual_size-1).each do |i|
    value = bin[i].to_i
    most_recurring[i] += value == 0 ? -1 : 1
  end
end

gamma = ""
epsilon = ""
most_recurring.each do |bit|
  if bit > 0
    gamma << "1"
    epsilon << "0"
  else
    gamma << "0"
    epsilon << "1"
  end
end

puts(gamma.to_i(2) * epsilon.to_i(2))
