input = File.open("input.txt").readlines.map{|i| i.strip }

def hasDupePairs(str)
  for i in 0..str.length-2
    target = "#{str[i]}#{str[i+1]}"
    for j in i+2..str.length-2
      return true if target == "#{str[j]}#{str[j+1]}"
    end
  end

  false
end

def hasBookends(str)
  for i in 0..str.length-3
    return true if str[i] === str[i+2]
  end

  false
end

goods = []
input.each do |i|
  goods.push(i) if hasDupePairs(i) && hasBookends(i)
end

puts goods.count