input = File.open("input.txt").readlines.map{|i| i.strip.split('x').map{|d| d.to_i}}

total = 0

input.each do |i|
  smalls = i.sort
  smalls.pop
  smalls.each do |s|
    total += 2*s
  end
  total += i.inject(:*)
end

puts total
