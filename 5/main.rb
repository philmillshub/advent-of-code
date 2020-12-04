input = File.open("../input/trees_map.txt").readlines.map{|i| i.strip}
rows = input.count
columns = input[0].length
y = 0
treesFound = 0

for x in 1..rows-1 # start loop at 1, because we don't care about the first row (row 0)
  y = y + 3
  if y >= columns
    y = y - columns
  end

  if input[x][y] === "#"
    treesFound = treesFound + 1
  end
end

puts treesFound