def bin2dec(binVal)
  binVal.reverse.map.with_index do |ch, i|
    ch.to_i * 2**i
  end.sum
end

input = File.open("input.txt").readlines.map{|i| i.strip}

gamma = []
epsilon = []

for x in 0..input[0].length-1
  binCount = [0, 0]

  input.each do |i|
    if i[x] === '0'
      binCount[0] += 1
    else
      binCount[1] += 1
    end
  end

  gamma[x] = binCount[0] > binCount[1] ? '0' : '1'
  epsilon[x] = binCount[0] > binCount[1] ? '1' : '0'
end

puts bin2dec(gamma) * bin2dec(epsilon)
