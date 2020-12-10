rows = File.open("input.txt").readlines.map{|i| i.strip.to_i }
builtIn = rows.max + 3
order = []
lastPick = 0
loop do
  for i in 0..rows.count-1
    for j in 1..3
      found = false
      if rows[i] - lastPick === j
        found = true
        lastPick = rows[i]
        order.push lastPick
        break
      end
      break if found
    end
  end
  break if (lastPick + 3) == builtIn
end
