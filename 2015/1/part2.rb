input = File.open("input.txt").readlines.map{|i| i.strip}.first.split('')
floor = 0
input.each.with_index do |i, k|
  case i
  when '('
    floor += 1
  when ')'
    floor -= 1
  end

  if floor < 0
    puts k+1
    return
  end
end