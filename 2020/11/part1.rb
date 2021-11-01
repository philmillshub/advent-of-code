rows = File.open("input.txt").readlines.map{|i| i.strip }
def eightAdjace(rows, i, j)
  [
    (rows[i-1][j-1] if i != 0 && j != 0),
    (rows[i-1][j] if i != 0),
    (rows[i-1][j+1] if i != 0 && j+1 != rows[i].length),
    (rows[i][j-1] if j != 0),
    (rows[i][j+1] if j+1 != rows[i].length),
    (rows[i+1][j-1] if i+1 != rows.count && j != 0),
    (rows[i+1][j] if i+1 != rows.count),
    (rows[i+1][j+1] if i+1 != rows.count && j+1 != rows[i].length)
  ]
end

loop do
  newState = rows.clone.map(&:clone)
  for i in 0..rows.count-1
    for j in 0..rows[i].length-1
      case rows[i][j]
      when 'L'
        newState[i][j] = '#' if eightAdjace(rows, i, j).count('#') === 0
      when '#'
        newState[i][j] = 'L' if eightAdjace(rows, i, j).count('#') >= 4
      end
    end
  end
  break if newState === rows
  rows = newState.clone.map(&:clone)
end

count = 0
rows.each do |r|
  count += r.count('#')
end
puts count