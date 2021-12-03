input = File.new('input.txt').read.split(/\n/)
# input = File.new('example.txt').read.split(/\n/)

def determine_most_recurring(arr, gas_type, bit_position)
  return [] if arr.empty?
  most_recurring = 0
  arr.each do |bin|
    most_recurring += bin[bit_position].to_i == 0 ? -1 : 1
  end
  if gas_type == :o2
    return most_recurring < 0 ? 0 : 1
  else
    return most_recurring < 0 ? 1 : 0
  end
end

filtered_o2 = input.dup
bit_position = 0
most_recurring = determine_most_recurring(input, :o2, bit_position)

while filtered_o2.size > 1 && bit_position < input.first.size do
  filtered_o2.delete_if do |byte|
    byte[bit_position].to_i != most_recurring
  end
  bit_position += 1
  most_recurring = determine_most_recurring(filtered_o2, :o2, bit_position)
end

filtered_co2 = input.dup
bit_position = 0
most_recurring = determine_most_recurring(input, :co2, bit_position)

while filtered_co2.size > 1 && bit_position < input.first.size do
  filtered_co2.delete_if do |byte|
    byte[bit_position].to_i != most_recurring
  end
  bit_position += 1
  most_recurring = determine_most_recurring(filtered_co2, :co2, bit_position)
end

puts(filtered_o2.first.to_i(2) * filtered_co2.first.to_i(2))
