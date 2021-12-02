input = File.open("input.txt").readlines.map{|i| i.to_i}

increases = 0
for i in 1..(input.count-1)
  if input[i] > input[i-1]
    increases += 1
  end
end

puts increases
