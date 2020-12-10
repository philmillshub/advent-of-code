rows = File.open("input.txt").readlines.map{|i| i.strip.to_i }.sort
jumps = [0, 0, 0]
rows.each_with_index do |r, idx|
  diff = 
  jumps[(r - (idx > 0 ? rows[idx-1] : 0))-1] += 1
end

puts jumps[0]*(jumps[2]+1) # +1 for the last jump to the device
