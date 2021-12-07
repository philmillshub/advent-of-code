input = File.open("input.txt").readlines.map{|i| i.strip}.first.split('')
floor = 0
input.each do |i|
  case i
  when '('
    floor += 1
  when ')'
    floor -= 1
  end
end

puts floor