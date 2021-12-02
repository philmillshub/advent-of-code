input = File.open("input.txt").readlines.map do |i|
  instr = i.split(' ')
  [instr[0], instr[1].to_i]
end

pos = 0
depth = 0

for i in 0..(input.count-1)
  case input[i][0]
  when "forward"
    pos += input[i][1]
  when "down"
    depth += input[i][1]
  when "up"
    depth -= input[i][1]
  end
end

puts pos * depth
