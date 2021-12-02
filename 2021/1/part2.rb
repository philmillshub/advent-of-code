input = File.open("input.txt").readlines.map{|i| i.to_i}

increases = 0
previous_sum = 0
for i in 0..(input.count-3)
  current_sum = input[i]+input[i+1]+input[i+2]
  if current_sum > previous_sum && previous_sum != 0
    increases += 1
  end
  previous_sum = current_sum
end

puts increases
