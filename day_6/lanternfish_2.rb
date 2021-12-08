input = File.new('input.txt').read
# input = File.new('example.txt').read

fishes = input.split(/,/).map(&:to_i)

arr = Array.new(9, 0)

fishes.each do |fish|
  arr[fish] += 1
end

(1..256).each do |day|
  zero = arr.delete_at(0)
  arr[6] += zero
  arr << zero
end

puts("After 256 days there are #{arr.sum} lanternfishes")