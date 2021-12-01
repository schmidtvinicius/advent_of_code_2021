#!/usr/bin/ruby -w

file = File.open('measurements.txt')
# file = File.open('measurements copy.txt')
input = file.read
input = input.split(/\n/)

input.map!(&:to_i)

previous = input[0]
greater_than = 0
(1..input.size-1).each do |i|
  greater_than += 1 if input[i] > previous
  previous = input[i]
end

puts "There are #{greater_than} values greater than the previous one!"
