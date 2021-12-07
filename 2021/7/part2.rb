input = File.open("input.txt").readlines.map{|i| i.strip.split(',')}.first.map{|i| i.to_i}

fuel = nil

for u in (input.min)..(input.max)
  localFuel = 0
  input.each do |v|
    if u != v
      n = (u-v).abs()
      localFuel += n * (n+1) / 2
    end
  end

  if fuel.nil? || localFuel < fuel
    fuel = localFuel
  end
end

puts fuel
