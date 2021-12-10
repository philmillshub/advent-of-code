@input = File.open("input.txt").readlines.map{|i| i.strip.chars.map{|j| j.to_i }}

def genChildren(p, children = [])
  theseChildren = []
  theseChildren.push({ :id => p[:id], :value => @input[p[:row]][p[:col]-1], :row => p[:row], :col => p[:col]-1 }) if p[:col] != 0 && @input[p[:row]][p[:col]-1] != 9
  theseChildren.push({ :id => p[:id], :value => @input[p[:row]][p[:col]+1], :row => p[:row], :col => p[:col]+1 }) if p[:col] != @input[0].count-1 && @input[p[:row]][p[:col]+1] != 9
  theseChildren.push({ :id => p[:id], :value => @input[p[:row]-1][p[:col]], :row => p[:row]-1, :col => p[:col] }) if p[:row] != 0 && @input[p[:row]-1][p[:col]] != 9
  theseChildren.push({ :id => p[:id], :value => @input[p[:row]+1][p[:col]], :row => p[:row]+1, :col => p[:col] }) if p[:row] != @input.count-1 && @input[p[:row]+1][p[:col]] != 9

  (theseChildren - theseChildren.select{|c| children.include?(c)}).each do |c|
    children.push(c)
    genChildren(c, children)
  end

  return children.uniq
end

lowPoints = []
currBasinId = 0
for row in 0..@input.count-1
  for col in 0..@input[row].count-1
    next if @input[row][col] === 9
    neighbors = []
    neighbors.push(@input[row][col-1]) unless col === 0
    neighbors.push(@input[row][col+1]) unless col === @input[row].count-1
    neighbors.push(@input[row-1][col]) unless row === 0
    neighbors.push(@input[row+1][col]) unless row === @input.count-1
    lowPoints.push({ :id => currBasinId += 1, :value => @input[row][col], :row => row, :col => col }) unless neighbors.any? { |n| n < @input[row][col] }
  end
end

basinSizes = []
lowPoints.each do |p|
  basinSizes.push((genChildren(p) + [p]).uniq.count)
end

puts basinSizes.sort[basinSizes.count-1] * basinSizes.sort[basinSizes.count-2] * basinSizes.sort[basinSizes.count-3]