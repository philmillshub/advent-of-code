input = File.open("input.txt").readlines.map{|i| i.strip.chars }

openers = ['{', '[', '<', '(']
closers = ['}', ']', '>', ')']
pairs = []
for i in 0..3
  pairs.push "#{openers[i]}#{closers[i]}"
end

illegalChars = []
input.each do |row|
  openerStack = []
  row.each do |val|
    openerStack.push(val) if openers.include? val
    if closers.include? val
      if pairs.include? "#{openerStack.last}#{val}"
        openerStack.pop
      else
        illegalChars.push(val)
        break
      end
    end
  end
end

sum = 0
illegalChars.each do |c|
  case c
  when ')' then sum += 3
  when ']' then sum += 57
  when '}' then sum += 1197
  when '>' then sum += 25137
  end
end

puts sum