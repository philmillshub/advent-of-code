input = File.open("input.txt").readlines.map{|i| i.strip}.first.split('')

santaPos = [0, 0]
botPos = [0, 0]

housePos = [[0, 0]]

input.each.with_index do |i, k|
  if k % 2 === 0 # santa
    case i
    when '^'
      santaPos[1] += 1
    when '>'
      santaPos[0] += 1
    when 'v'
      santaPos[1] -= 1
    when '<'
      santaPos[0] -= 1
    end
    housePos.push([santaPos[0], santaPos[1]])
  else #bot
    case i
    when '^'
      botPos[1] += 1
    when '>'
      botPos[0] += 1
    when 'v'
      botPos[1] -= 1
    when '<'
      botPos[0] -= 1
    end
    housePos.push([botPos[0], botPos[1]])
  end

end

puts housePos.uniq.count