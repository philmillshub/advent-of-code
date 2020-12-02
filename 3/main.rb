valid = 0
input = File.open("../input/password_policy.txt").readlines.each do |i|
  colon = i.index(':')
  policy = i[0..colon-1]
  password = i[colon+2..-1].strip
  
  range = policy[0..-3]
  dash = range.index('-')
  low = range[0..dash-1].to_i
  high = range[dash+1..-1].to_i

  check = policy[-1]

  count = password.count(check)
  if count >= low && count <= high
    valid = valid + 1
  end
end

puts valid