input = File.open("input.txt").readlines.map{|i| i.strip }
timestamp = input[0].to_i

routes = input[1]
  .split(',')
  .select{ |r| r != 'x' }
  .map{ |r| {
    id: r.to_i,
    lastTimestamp: r.to_i * (timestamp / r.to_i),
    nextTimestamp: r.to_i + (r.to_i * (timestamp / r.to_i))
  } }

nextBus = routes[0][:id]
waitTime = routes[0][:nextTimestamp] - timestamp

for idx in 1..routes.count-1
  if routes[idx][:nextTimestamp] - timestamp < waitTime
    nextBus = routes[idx][:id]
    waitTime = routes[idx][:nextTimestamp] - timestamp
  end
end

puts nextBus * waitTime