input = File.open("input.txt").readlines.map{|i| i.strip.chars }

openers = ['{', '[', '<', '(']
closers = ['}', ']', '>', ')']
pairs = []
for i in 0..3
  pairs.push "#{openers[i]}#{closers[i]}"
end

illegalRows = []
input.each do |row|
  openerStack = []
  row.each do |val|
    openerStack.push(val) if openers.include? val
    if closers.include? val
      if pairs.include? "#{openerStack.last}#{val}"
        openerStack.pop
      else
        illegalRows.push(row)
        break
      end
    end
  end
end

incompleteRows = input - illegalRows

scores = []

incompleteRows.each do |row|
  openerStack = []
  row.each do |val|
    openerStack.push(val) if openers.include? val
    openerStack.pop if closers.include?(val) && pairs.include?("#{openerStack.last}#{val}")
  end
  closerStack = openerStack.reverse.map{ |c| closers[openers.index(c)] }

  score = 0
  closerStack.each do |c|
    score *= 5
    case c
    when ')' then score += 1
    when ']' then score += 2
    when '}' then score += 3
    when '>' then score += 4
    end  
  end

  scores.push(score)
end

puts scores.sort[scores.length/2]