input = File.open("input.txt").readlines.map{|i| i.strip.split(',')}.first.map{|i| i.to_i}

uniques = input.uniq

fuel = nil

uniques.each do |u|
  localFuel = 0
  input.each do |v|
    localFuel += (u-v).abs()
  end

  if fuel.nil? || localFuel < fuel
    fuel = localFuel
  end
end

puts fuel
