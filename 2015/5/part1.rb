input = File.open("input.txt").readlines.map{|i| i.strip }

def hasVowels(str, c)
  v = ['a', 'e', 'i', 'o', 'u']
  vCount = 0
  for i in 0..str.length-1
    vCount += 1 if v.include?(str[i])
  end

  vCount >= c
end

def hasDoubles(str)
  for i in 0..str.length-2
    return true if str[i] === str[i+1]
  end

  false
end

def isBad(str)
  bads = ['ab', 'cd', 'pq', 'xy']
  for i in 0..str.length-2
    return true if bads.include?("#{str[i]}#{str[i+1]}")
  end

  false
end

goods = []
input.each do |i|
  goods.push(i) if hasVowels(i, 3) && hasDoubles(i) && !isBad(i)
end

puts goods.count
