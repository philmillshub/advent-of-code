rows = File.open("input.txt").readlines.map{|i| i.strip}
acc = 0
line = 0
prevLines = []

loop do
  if prevLines.include?(line)
    break
  end

  prevLines.push line

  instr = rows[line].split(' ')

  if instr[0] == 'nop'
    line += 1
  elsif instr[0] == 'acc'
    acc += instr[1].to_i
    line += 1
  elsif instr[0] == 'jmp'
    line += instr[1].to_i
  end
end

puts acc