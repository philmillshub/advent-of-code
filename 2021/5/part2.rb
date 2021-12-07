input = File.open("input.txt").readlines.map do |i|
  coords = i.strip.split(' -> ')
  coords[0] = coords[0].split(',')
  coords[1] = coords[1].split(',')
  { :x1 => coords[0][0].to_i, :y1 => coords[0][1].to_i, :x2 => coords[1][0].to_i, :y2 => coords[1][1].to_i }
end

myMap = Array.new(1000){Array.new(1000, 0)}

input.each do |i|
  if i[:x1] === i[:x2]
    for y in ([i[:y1], i[:y2]].min)..([i[:y1], i[:y2]].max)
      myMap[i[:x1]][y] += 1
    end
  elsif i[:y1] === i[:y2]
    for x in ([i[:x1], i[:x2]].min)..([i[:x1], i[:x2]].max)
      myMap[x][i[:y1]] += 1
    end
  else
    xDiff = i[:x1] - i[:x2]
    yDiff = i[:y1] - i[:y2]
    yOffset = 0

    if xDiff < 0
      for x in i[:x1]..i[:x2]
        if yDiff < 0
          puts "coords: #{x},#{i[:y1]+yOffset}"
          myMap[x][i[:y1]+yOffset] += 1
        else
          puts "coords: #{x},#{i[:y1]-yOffset}"
          myMap[x][i[:y1]-yOffset] += 1
        end
        yOffset += 1
      end
    else
      for x in i[:x2]..i[:x1]
        if yDiff < 0
          puts "coords: #{x},#{i[:y2]-yOffset}"
          myMap[x][i[:y2]-yOffset] += 1
        else
          puts "coords: #{x},#{i[:y2]+yOffset}"
          myMap[x][i[:y2]+yOffset] += 1
        end
        yOffset += 1
      end
    end
  end
end

over1 = 0
myMap.each do |row|
  row.each do |box|
    over1 += 1 if box > 1
  end
end

puts over1