rows = File.open("../input/boarding_passes.txt").readlines.map{|i| i.strip}
seats = []
maxID = 0
rows.each do |r|
  seat = { pass: r, row: nil, column: nil }
  lower = 0
  upper = 127
  for i in 0..6
    block = upper - lower + 1
    if r[i] == 'F'
      upper = upper - (block / 2)
    else
      lower = lower + (block / 2)
    end
  end
  if upper == lower
    seat[:row] = upper
  end
  lower = 0
  upper = 7
  for i in 7..9
    block = upper - lower + 1
    if r[i] == 'L'
      upper = upper - (block / 2)
    else
      lower = lower + (block / 2)
    end
  end
  if upper == lower
    seat[:column] = upper
  end
  if seat[:row] && seat[:column]
    seat[:id] = (seat[:row] * 8) + seat[:column]
    maxID = seat[:id] if seat[:id] > maxID
  end
  seats.push seat
end
puts maxID