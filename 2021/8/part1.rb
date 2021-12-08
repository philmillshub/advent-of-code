input = File.open("input.txt").readlines.map do |i|
  sides = i.strip.split(' | ')
  signals = sides[0].split(' ')
  output = sides[1].split(' ')
  { :signals => signals, :output => output }
end

count = 0
input.each do |i|
  i[:output].each do |o|
    count += 1 if [2, 3, 4, 7].include?(o.length)
  end
end

puts count