input = File.open("input.txt").readlines.map{|i| i.strip.chars.map{|j| j.to_i}}

lowPoints = []
for row in 0..input.count-1
  for col in 0..input[row].count-1
    neighbors = []
    neighbors.push(input[row][col-1]) unless col === 0
    neighbors.push(input[row][col+1]) unless col === input[row].count-1
    neighbors.push(input[row-1][col]) unless row === 0
    neighbors.push(input[row+1][col]) unless row === input.count-1
    lowPoints.push(input[row][col]neighbors.any? { |n| n < val }
    break
  end
  break
end
