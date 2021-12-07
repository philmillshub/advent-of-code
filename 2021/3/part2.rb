def bin2dec(binVal)
  binVal.reverse.map.with_index do |ch, i|
    ch.to_i * 2**i
  end.sum
end

def finder(inputArray, findType)
  for x in 0..11
    binCount = [0, 0]

    inputArray.each do |i|
      if i[x] === '0'
        binCount[0] += 1
      else
        binCount[1] += 1
      end
    end

    leader = binCount[0] > binCount[1] ? '0' : '1'
    inputArray = findType === "most" ? (inputArray.select{|i| i[x] === leader}) : (inputArray.select{|i| i[x] != leader})

    if inputArray.count === 1
      return inputArray[0]
    end
  end
end

input = File.open("input.txt").readlines.map{|i| i.strip.split('')}

puts bin2dec(finder(input, "most")) * bin2dec(finder(input, "least"))

