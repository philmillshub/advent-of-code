input = File.open("input.txt").readlines.map{|i| i.strip.chars.map{|j| j.to_i}}

lowPoints = []
for row in 0..input.count-1
  for col in 0..input[row].count-1
    next if input[row][col] === 9
    neighbors = []
    neighbors.push(input[row][col-1]) unless col === 0
    neighbors.push(input[row][col+1]) unless col === input[row].count-1
    neighbors.push(input[row-1][col]) unless row === 0
    neighbors.push(input[row+1][col]) unless row === input.count-1
    lowPoints.push(input[row][col]) unless neighbors.any? { |n| n < input[row][col] }
  end
end

puts lowPoints.sum + lowPoints.count
