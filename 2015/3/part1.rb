input = File.open("input.txt").readlines.map{|i| i.strip}.first.split('')

currPos = [0, 0]

housePos = [[0, 0]]

input.each do |i|
  case i
  when '^'
    currPos[1] += 1
  when '>'
    currPos[0] += 1
  when 'v'
    currPos[1] -= 1
  when '<'
    currPos[0] -= 1
  end

  housePos.push([currPos[0], currPos[1]])
end

puts housePos.uniq.count