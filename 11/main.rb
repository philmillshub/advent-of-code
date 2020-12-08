rows = File.open("../input/customs.txt").readlines.map{|i| i.strip}
answers = []
answer = ""

rows.each do |r|
  if r.length > 0
    answer = answer + r
  else
    answers.push(answer.split('').uniq.join(''))
    answer = ""
  end
end

if answer != ""
  answers.push(answer.split('').uniq.join(''))
end

count = 0
answers.each do |a|
  count = count + a.length
end

puts count