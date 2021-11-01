rows = File.open("input.txt").readlines.map{|i| i.strip.to_i }
badNumber = nil
for i in 25..rows.count-1
  found = false
  for j in i-25..i-2
    for k in j+1..i-1
      if rows[j]+rows[k] == rows[i]
        found = true
        break
      end
    end
    break if found
  end

  if !found
    badNumber = rows[i]
    break
  end
end

startIndex = nil
endIndex = nil

for i in 0..rows.count-1
  runningTotal = 0
  for j in i..rows.count-1
    runningTotal += rows[j]
    if runningTotal == badNumber
      startIndex = i
      endIndex = j
      break
    end
    if runningTotal > badNumber
      runningTotal = 0
      break
    end
  end
  next if startIndex == nil && endIndex == nil
  break unless startIndex == nil && endIndex == nil
end

puts rows[startIndex..endIndex].min + rows[startIndex..endIndex].max
