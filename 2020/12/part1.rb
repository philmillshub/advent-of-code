rows = File.open("input.txt").readlines.map{|i| { command: i.strip[0], units: i.strip[1..-1].to_i }}
heading = 0
position = { east: 0, north: 0 }

for i in 0..rows.count-1
  case rows[i][:command]
  when 'N'
    position[:north] += rows[i][:units]
  when 'S'
    position[:north] -= rows[i][:units]
  when 'E'
    position[:east] += rows[i][:units]
  when 'W'
    position[:east] -= rows[i][:units]
  when 'L'
    heading += rows[i][:units]
    heading -= 360 if heading >= 360
  when 'R'
    heading -= rows[i][:units]
    heading = 360 + heading if heading < 0
  when 'F'
    case heading
    when 0
      position[:east] += rows[i][:units]
    when 90
      position[:north] += rows[i][:units]
    when 180
      position[:east] -= rows[i][:units]
    when 270
      position[:north] -= rows[i][:units]
    end
  end
  if ![0, 90, 180, 270].include?(heading) # just some error handling :)
    puts "ALERT: BAD ANGLE: #{heading}"
    puts "LAST COMMAND: #{rows[i]}"
    break
  end
end

puts position[:east].abs + position[:north].abs