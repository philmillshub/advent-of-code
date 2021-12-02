input = File.open("input.txt").readlines.map{|i| i}

pos = 0
depth = 0

for i in 0..(input.count-1)
  instr = input[i].split(' ')
  case instr[0]
  when "forward"
    pos += instr[1].to_i
  when "down"
    depth += instr[1].to_i
  when "up"
    depth -= instr[1].to_i
  end
end

puts pos * depth
