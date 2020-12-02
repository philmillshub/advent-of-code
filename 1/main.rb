input = File.open("../input/expense_report.txt").readlines.map{|i| i.to_i}
for i in 0..(input.count-1)
  for j in (i+1)..(input.count-1)
    sum = input[i] + input[j]
    if sum === 2020
      puts input[i] * input[j]
      break
    end
  end
  break if sum === 2020
end