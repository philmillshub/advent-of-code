input = File.open("input.txt").readlines.map{|i| i.strip.split(',')}.first.map{|i| i.to_i}

population = Array.new(9, 0)

input.each do |i|
  population[i] += 1
end

for day in 1..256
  nextHatch = population[0]

  for clock in 1..8
    population[clock-1] = population[clock]
  end

  population[8] = nextHatch
  population[6] += nextHatch
end

puts population.sum