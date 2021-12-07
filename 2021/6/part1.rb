input = File.open("input.txt").readlines.map{|i| i.strip.split(',')}.first.map{|i| i.to_i}

for day in 1..80
  output = input
  hatch = 0
  input.each.with_index do |i, idx|
    if i === 0
      output[idx] = 6
      hatch += 1
    else
      output[idx] = i - 1
    end
  end

  for h in 1..hatch
    output.push(8)
  end if hatch > 0

  input = output
end

puts input.count