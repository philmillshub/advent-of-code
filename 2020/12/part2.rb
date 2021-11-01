rows = File.open("input.txt").readlines.map{|i| { command: i.strip[0], units: i.strip[1..-1].to_i }}
position = { east: 0, north: 0 }
waypoint = { east: 10, north: 1 }

for i in 0..rows.count-1
  case rows[i][:command]
  when 'N'
    waypoint[:north] += rows[i][:units]
  when 'S'
    waypoint[:north] -= rows[i][:units]
  when 'E'
    waypoint[:east] += rows[i][:units]
  when 'W'
    waypoint[:east] -= rows[i][:units]
  when 'L'
    clicks = rows[i][:units] / 90
    case (rows[i][:units] / 90)
    when 1
      waypoint = { east: (waypoint[:north] * -1), north: waypoint[:east] }
    when 2
      waypoint = { east: (waypoint[:east] * -1), north: (waypoint[:north] * -1)}
    when 3
      waypoint = { east: waypoint[:north], north: (waypoint[:east] * -1) }
    else
      puts "ALERT: BAD ANGLE: #{rows[i][:units]}"
      puts "LAST COMMAND: #{rows[i]}"
      break  
    end
  when 'R'
    clicks = rows[i][:units] / 90
    case (rows[i][:units] / 90)
    when 1
      waypoint = { east: waypoint[:north], north: (waypoint[:east] * -1) }
    when 2
      waypoint = { east: (waypoint[:east] * -1), north: (waypoint[:north] * -1)}
    when 3
      waypoint = { east: (waypoint[:north] * -1), north: waypoint[:east] }
    else
      puts "ALERT: BAD ANGLE: #{rows[i][:units]}"
      puts "LAST COMMAND: #{rows[i]}"
      break  
    end
  when 'F'
    position[:east] += rows[i][:units] * waypoint[:east]
    position[:north] += rows[i][:units] * waypoint[:north]
  end
end

puts position[:east].abs + position[:north].abs