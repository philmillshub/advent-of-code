input = File.open("input.txt").readlines.map{|i| i.strip.split('x').map{|d| d.to_i}}

total = 0

input.each do |i|
  areas = [ i[0]*i[1], i[1]*i[2], i[2]*i[0] ]
  total += (2*areas[0]) + (2*areas[1]) + (2*areas[2]) + areas.min
end

puts total
