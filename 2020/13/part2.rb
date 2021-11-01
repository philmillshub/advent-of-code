routes = []
File.open("input.txt").readlines.map{|i| i.strip }[1].split(',').each_with_index do |r, i|
  if r != 'x'
    routes.push({ id: r.to_i, offset: i })
  end
end

routes.each do |r|
  puts "(t + #{r[:offset]}) % #{r[:id]} == 0?"
end

return

# B R O O T F O R Z
timestamp = 100000000000000 # the problem description hints that the answer will be larger than this
loop do
  valid = true
  routes.each do |r|
    if (timestamp + r[:offset]) % r[:id] != 0
      valid = false
      break
    end
  end
  timestamp += 1 unless valid
  break if valid
end

puts timestamp