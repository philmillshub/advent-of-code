input = File.open("input.txt").readlines.map do |i|
  sides = i.strip.split(' | ')
  signals = sides[0].split(' ')
  output = sides[1].split(' ')
  { :signals => signals, :output => output }
end

def arrayToStr(arr)
  arr*""
end

def arrayToInt(arr)
  arrayToStr(arr).to_i
end

def strSort(str)
  arrayToStr(str.chars.sort)
end

def strDiff(str1, str2)
  arrayToStr(str1.chars - str2.chars)
end

def strCommon(str1, str2)
  arrayToStr(str1.chars & str2.chars)
end

sum = 0
input.each.with_index do |i, idx|
  signals = Array.new(10, '')
  pattern = Array.new(7, '')
  i[:signals].each do |s|
    signals[1] = s if s.length === 2
    signals[4] = s if s.length === 4
    signals[7] = s if s.length === 3
    signals[8] = s if s.length === 7
  end

  pattern[0] = strDiff(signals[7], signals[1])
  possible25 = signals[1]
  possible13 = strDiff(signals[4], signals[1])
  possible46 = strDiff(strDiff(signals[8], signals[4]), signals[7])
  possible36 = nil

  i[:signals].select{|si| si.length === 5}.each do |s|
    if strDiff(s, signals[7]).length === 2
      possible36 = strDiff(s, signals[7])
    end
  end

  pattern[3] = strCommon(possible13, possible36)
  pattern[6] = strCommon(possible46, possible36)
  pattern[4] = strDiff(possible46, pattern[6])
  pattern[1] = strDiff(possible13, pattern[3])

  partial6 = [pattern[0], pattern[1], pattern[3], pattern[4], pattern[6]].join()

  i[:signals].select{|si| si.length === 6}.each do |s|
    pattern[5] = strDiff(s, partial6) if strDiff(s, partial6).length === 1
  end

  pattern[2] = strDiff(signals[1], pattern[5])

  signals[0] = "#{pattern[0]}#{pattern[1]}#{pattern[2]}#{pattern[4]}#{pattern[5]}#{pattern[6]}"
  signals[2] = "#{pattern[0]}#{pattern[2]}#{pattern[3]}#{pattern[4]}#{pattern[6]}"
  signals[3] = "#{pattern[0]}#{pattern[2]}#{pattern[3]}#{pattern[5]}#{pattern[6]}"
  signals[5] = "#{pattern[0]}#{pattern[1]}#{pattern[3]}#{pattern[5]}#{pattern[6]}"
  signals[6] = "#{pattern[0]}#{pattern[1]}#{pattern[3]}#{pattern[4]}#{pattern[5]}#{pattern[6]}"
  signals[9] = "#{pattern[0]}#{pattern[1]}#{pattern[2]}#{pattern[3]}#{pattern[5]}#{pattern[6]}"

  number = []
  i[:output].each do |o|
    signals.each.with_index do |s, k|
      if strSort(o) === strSort(s)
        number.push(k)
        break
      end
    end
  end

  sum += arrayToInt(number)
end

puts sum