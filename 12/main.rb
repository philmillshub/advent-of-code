rows = File.open("../input/customs.txt").readlines.map{|i| i.strip}
answers = []
answer = []

rows.each do |r|
  if r.length > 0
    answer.push r.split('')
  else
    commons = answer[0]
    if answer.count > 1
      for i in 1..answer.count-1
        commons = commons & answer[i]
      end
    end
    answers.push commons
    answer = []
  end
end

if answer.count > 0
  commons = answer[0]
  if answer.count > 1
    for i in 1..answer.count-1
      commons = commons & answer[i]
    end
  end
  answers.push commons
end

count = 0
answers.each do |a|
  count = count + a.count
end
puts count