#!/usr/bin/ruby -w

file = File.open('measurements.txt')
# file = File.open('measurements copy.txt')
input = file.read
input = input.split(/\n/)

input.map!(&:to_i)

lower = 0
upper = 2

previous = input[lower..upper].sum
greater_than = 0
while upper < input.size do
  puts(previous)
  lower += 1
  upper += 1
  greater_than += 1 if input[lower..upper].sum > previous
  previous = input[lower..upper].sum
end

puts "There are #{greater_than} values greater than the previous one!"