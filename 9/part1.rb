rows = File.open("input.txt").readlines.map{|i| i.strip.to_i }
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
    puts rows[i]
    break
  end
end
