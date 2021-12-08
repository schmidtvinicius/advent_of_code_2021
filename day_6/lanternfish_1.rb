input = File.new('input.txt').read
# input = File.new('example.txt').read

fishes = input.split(/,/).map(&:to_i)

puts("Initial state: #{fishes.to_s}")
(1..80).each do |day|
  new_fishes = []
  fishes.map! do |fish|
    case fish
    when 0
      new_fishes << 8
      6
    else
      fish -= 1
    end
  end
  fishes.concat new_fishes
  # puts("After #{day} #{day == 1 ? "day" : "days"}: #{fishes.size}")
  puts("#{day}")
end

puts("After 80 days there are #{fishes.size} lanternfishes")