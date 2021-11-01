rows = File.open("input.txt").readlines.map{|i| i.strip }
def eightDirections(rows, i, j)
  compass = [
    { direction: 'NW', x: i-1, y: j-1, found: false, value: nil},
    { direction: 'N', x: i-1, y: j, found: false, value: nil},
    { direction: 'NE', x: i-1, y: j+1, found: false, value: nil},
    { direction: 'E', x: i, y: j+1, found: false, value: nil},
    { direction: 'SE', x: i+1, y: j+1, found: false, value: nil},
    { direction: 'S', x: i+1, y: j, found: false, value: nil},
    { direction: 'SW', x: i+1, y: j-1, found: false, value: nil},
    { direction: 'W', x: i, y: j-1, found: false, value: nil},
  ]
  while compass.select{ |c| c[:found] }.count != 8 do
    # eliminate out of bounds values
    compass.select{ |d| d[:x] < 0 || d[:x] >= rows.count || d[:y] < 0 || d[:y] >= rows[i].length}.map{ |e| e[:found] = true }
    compass.select{ |d| d[:found] == false }.map do |e|
      # set value if it's not a dot
      e[:value] = rows[e[:x]][e[:y]] if rows[e[:x]][e[:y]] != '.'
      # set found to true if value is set
      e[:found] = true if e[:value]
      if !e[:found]
        # if not found, move position based on direction
        case e[:direction]
        when 'NW'
          e[:x] -= 1
          e[:y] -= 1
        when 'N'
          e[:x] -= 1
        when 'NE'
          e[:x] -= 1
          e[:y] += 1
        when 'E'
          e[:y] += 1
        when 'SE'
          e[:x] += 1
          e[:y] += 1
        when 'S'
          e[:x] += 1
        when 'SW'
          e[:x] += 1
          e[:y] -= 1
        when 'W'
          e[:y] -= 1
        end
      end
    end
  end

  compass.select{ |h| h[:value] === "#" }.count
end

loop do
  newState = rows.clone.map(&:clone)
  for i in 0..rows.count-1
    for j in 0..rows[i].length-1
      case rows[i][j]
      when 'L'
        newState[i][j] = '#' if eightDirections(rows, i, j) === 0
      when '#'
        newState[i][j] = 'L' if eightDirections(rows, i, j) >= 5
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