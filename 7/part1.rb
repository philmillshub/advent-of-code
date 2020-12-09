rows = File.open("input.txt").readlines.map{|i| i.strip}
regex = /(.+) bags contain ((\d|no) .+ bags?)./

rules = []

rows.each do |r|
  match = r.match regex
  rule = {
    container: match[1],
    inside: match[2].split(', ').map do |b|
      {
        count: b.gsub(/ bags?/, "").split(' ', 2).first,
        container: b.gsub(/ bags?/, "").split(' ', 2).last
      }
    end
  }
  rules.push rule
end

target = "shiny gold"

validBags = []
count = 0

loop do
  rules.each do |r|
    r[:inside].each do |i|
      if i[:container] == target || validBags.include?(i[:container])
        validBags.push r[:container]
        break
      end
    end
  end
  break if validBags.uniq.count == count
  count = validBags.uniq.count
end

puts count