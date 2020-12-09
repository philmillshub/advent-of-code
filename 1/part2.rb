input = File.open("input.txt").readlines.map{|i| i.to_i}
for i in 0..(input.count-1)
  for j in (i+1)..(input.count-1)
    for k in (j+1)..(input.count-1)
      sum = input[i] + input[j] + input[k]
      if sum === 2020
        puts input[i] * input[j] * input[k]
        break
      end
    end
    break if sum === 2020
  end
  break if sum === 2020
end