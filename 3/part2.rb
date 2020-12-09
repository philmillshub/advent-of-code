input = File.open("input.txt").readlines.map{|i| i.strip}
rows = input.count
columns = input[0].length
xArray = [1, 1, 1, 1, 2]
yArray = [1, 3, 5, 7, 1]
treesFound = [0, 0, 0, 0, 0]

for path in 0..4
  y = 0
  for x in (xArray[path]..rows-1).step(xArray[path])
    y = y + yArray[path]
    if y >= columns
      y = y - columns
    end
  
    if input[x][y] === "#"
      treesFound[path] = treesFound[path] + 1
    end
  end
end

puts treesFound.reject(&:zero?).inject(:*)