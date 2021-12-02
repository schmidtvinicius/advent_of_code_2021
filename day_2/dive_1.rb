file = File.new('input.txt')
# file = File.new('example.txt')
input = file.read
input = input.split(/\n/)

commands = input.map do |command| 
  movement, value = command.split(/\s/)
  [movement.to_sym, value.to_i]
end

x_pos = 0
depth = 0

commands.each do |command|
  case command[0]
  when :forward
    x_pos += command[1]
  when :up
    depth = command[1] > depth ? 0 : depth - command[1]
  when :down
    depth += command[1]
  end
end

puts("Horizontal position is: #{x_pos}
      Depth is: #{depth}
      Multiply those two and you get: #{x_pos * depth}")
