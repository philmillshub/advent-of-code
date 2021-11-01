rows = File.open("input.txt").readlines.map{|i| i.strip}
regex = /(.+) bags contain ((\d|no) .+ bags?)./

@rules = []

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
  @rules.push rule
end

def fetcher(container)
  count = 1
  rule = @rules.select { |r| r[:container] == container }.first

  rule[:inside].each do |s|
    if s[:container] != "other"
      count += s[:count].to_i * fetcher(s[:container])
    end
  end

  count
end

puts fetcher("shiny gold") - 1
