# I practically cribbed this from someone else's solution
# I feel horrible...
@rows = File.open("input.txt").readlines.map{ |i| i.strip.to_i }.sort
@rows.append(@rows.max+3)

@paths = {}
@globalInput = []

def pather(lastPick = 0, lastIdx = -1, path = [])
  return @paths[lastPick] unless @paths[lastPick].nil?

  indices = []
  for i in lastIdx+1..[lastIdx+3,@rows.count-1].min
    indices.push(i) if (!@rows[i].nil? && @rows[i]-lastPick <= 3)
  end

  return @paths[lastPick] = 1 if indices.empty?
  @paths[lastPick] = indices.map { |i| pather(@rows[i], i)  }.sum
end

puts pather