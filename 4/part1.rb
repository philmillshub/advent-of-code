rows = File.open("input.txt").readlines.map{|i| i.strip}
passports = []
passport = {}

rows.each do |r|
  if r.length > 0
    elements = r.split(' ')
    elements.each do |e|
      element = e.split(':')
      passport[element[0]] = element[1]
    end
  else
    passports.push(passport)
    passport = {}
  end
end

validCount = 0

passports.each do |x|
  if x.count === 8
    validCount = validCount + 1
  elsif x.count === 7 && !x.key?("cid")
    validCount = validCount +1
  end
end

puts validCount