input = File.open("input.txt").readlines.map{|i| i.strip.split(',')}.first.map{|i| i.to_i}

fuel = nil

for u in (input.min)..(input.max)
  localFuel = 0
  input.each do |v|
    if u != v
      for s in 1..(u-v).abs()
        localFuel += s
      end
    end
  end

  if fuel.nil? || localFuel < fuel
    fuel = localFuel
  end
end

puts fuel
