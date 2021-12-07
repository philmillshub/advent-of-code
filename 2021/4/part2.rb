input = File.open("input.txt").readlines.map{|i| i.strip}

def winCheck(card)
  card.each do |row|
    return true if row[0][:marked] && row[1][:marked] && row[2][:marked] && row[3][:marked] && row[4][:marked]
  end
  for i in 0..4
    return true if card[0][i][:marked] && card[1][i][:marked] && card[2][i][:marked] && card[3][i][:marked] && card[4][i][:marked]
  end
  return true if card[0][0][:marked] && card[1][1][:marked] && card[2][2][:marked] && card[3][3][:marked] && card[4][4][:marked]
  return true if card[0][4][:marked] && card[1][3][:marked] && card[2][2][:marked] && card[3][1][:marked] && card[4][0][:marked]

  false
end

def cardRun(numbers, cards)
  winOrder = 1
  numbers.each do |d|
    cards.each.with_index do |card, idx|
      if !card[:winner]
        card[:layout].each do |row|
          row.each do |square|
            square[:marked] = true if square[:value] === d
          end
        end
        if winCheck(card[:layout])
          card[:winner] = true
          card[:order] = winOrder
          card[:call] = d
          winOrder += 1
        end
      end
    end
  end
end

numbers = input[0].split(',').map{|n| n.to_i}

cards = []
card = []
for x in 2..input.length-1
  if input[x].length === 0
    cards.push({ :winner => false, :order => 0, :layout => card})
    card = []
  else
    card.push(input[x].split(' ').map{|c| { :marked => false, :value => c.to_i}})
  end
end
cards.push({ :winner => false, :order => 0, :call => 0, :layout => card})

cardRun(numbers, cards)

lastCardDetails = cards.select{|c| c[:order] === 100 }.first
lastCard = lastCardDetails[:layout]
sum = 0
lastCard.each do |row|
  row.each do |square|
    sum += square[:value] unless square[:marked]
  end
end

puts sum * lastCardDetails[:call]