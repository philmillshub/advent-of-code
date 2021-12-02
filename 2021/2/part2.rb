input = File.open("input.txt").readlines.map do |i|
  instr = i.split(' ')
  [instr[0], instr[1].to_i]
end

pos = 0
depth = 0
aim = 0

input.each do |i|
  case i[0]
  when "forward"
    pos += i[1]
    depth += aim * i[1]
  when "down"
    aim += i[1]
  when "up"
    aim -= i[1]
  end
end

puts pos * depth
