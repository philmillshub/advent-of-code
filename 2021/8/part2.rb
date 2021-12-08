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

input = File.open("input.txt").readlines.map do |i|
  sides = i.strip.split(' | ')
  signals = sides[0].split(' ').map{|s| strSort(s)}
  output = sides[1].split(' ').map{|o| strSort(o)}
  { :signalInput => signals, :output => output }
end

sum = 0

input.each.with_index do |i, idx|
  signals = Array.new(10, '')
  pattern = Array.new(7, '')

  # PATTERN FOR ARRAY INDICES
  #      0
  #   -------
  #   |     |
  # 1 |     | 2
  #   |  3  |
  #   -------
  #   |     |
  # 4 |     | 5
  #   |  6  |
  #   -------

  # We know some signals match to specific numbers based on length
  signals[1] = i[:signalInput].select{|s| s.length === 2}.first
  signals[4] = i[:signalInput].select{|s| s.length === 4}.first
  signals[7] = i[:signalInput].select{|s| s.length === 3}.first
  signals[8] = i[:signalInput].select{|s| s.length === 7}.first
  # find a 5-char long signal whose diff with 7 leave 2 values -- this will be the signal for 3
  signals[3] = i[:signalInput].select{|si| si.length === 5 && strDiff(si, signals[7]).length === 2}.first

  # determine unique possible pairs
  possible25 = signals[1] # the pattern for a 1 is links 2 and 5
  possible13 = strDiff(signals[4], signals[1]) # remove the 1 from the 4 and you're left with links 1 and 3
  possible46 = strDiff(strDiff(signals[8], signals[4]), signals[7]) # remove 4 and 7 from 8, and you're left with links 4 and 6
  possible36 = strDiff(signals[3], signals[7]) # remove the 7 from the 3 and you're left with links 3 and 6

  # set pattern values (links) based on commonalities, then differences
  pattern[3] = strCommon(possible13, possible36) # common between (1,3) and (3,6) gives us 3
  pattern[6] = strCommon(possible46, possible36) # common between (4,6) and (3,6) gives us 6
  pattern[4] = strDiff(possible46, pattern[6])   # diff between (4,6) and 6 leaves 4
  pattern[1] = strDiff(possible13, pattern[3])   # diff between (1,3) and 3 leaves 1

  # link #0 is just the signal for 7 minus the signal for 1
  pattern[0] = strDiff(signals[7], signals[1])

  # we know everything about making a 6 (0,1,3,4,5,6) except for link #5
  partial6 = "#{pattern[0]}#{pattern[1]}#{pattern[3]}#{pattern[4]}#{pattern[6]}"
  pattern[5] = strDiff(i[:signalInput].select{|si| si.length === 6 && strDiff(si, partial6).length === 1}.first, partial6)

  # link #2 is just the signal for 1 minus link #5
  pattern[2] = strDiff(signals[1], pattern[5])

  # with the pattern now discovered, set the signals for the rest of the numbers
  signals[0] = strSort("#{pattern[0]}#{pattern[1]}#{pattern[2]}#{pattern[4]}#{pattern[5]}#{pattern[6]}")
  signals[2] = strSort("#{pattern[0]}#{pattern[2]}#{pattern[3]}#{pattern[4]}#{pattern[6]}")
  signals[5] = strSort("#{pattern[0]}#{pattern[1]}#{pattern[3]}#{pattern[5]}#{pattern[6]}")
  signals[6] = strSort("#{pattern[0]}#{pattern[1]}#{pattern[3]}#{pattern[4]}#{pattern[5]}#{pattern[6]}")
  signals[9] = strSort("#{pattern[0]}#{pattern[1]}#{pattern[2]}#{pattern[3]}#{pattern[5]}#{pattern[6]}")

  number = []
  i[:output].each do |o|
    # select the value from signals where it matches the output
    # then find its index in signals -- that's the translated number
    number.push signals.index(signals.select{|s| s === o}.first)
  end

  # make the array into a real number, add it to the sum
  sum += arrayToInt(number)
end

puts sum