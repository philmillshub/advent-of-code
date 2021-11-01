@rows = File.open("input.txt").readlines.map{|i| { cmd: i.strip.split(' ').first, cnt: i.strip.split(' ').last.to_i }}
acc = 0
line = 0
prevLines = []
@lastSwap = 0

def swap()
  changed = false
  if @lastSwap > 0
    if @rows[@lastSwap][:cmd] == 'nop'
      @rows[@lastSwap][:cmd] = 'jmp'
    else
      @rows[@lastSwap][:cmd] = 'nop'
    end
  end

  @rows.each_with_index do |r, idx|
    if ['nop','jmp'].include?(r[:cmd]) && idx > @lastSwap
      changed = true
      @lastSwap = idx
      if r[:cmd] == 'nop'
        @rows[idx][:cmd] = 'jmp'
      else
        @rows[idx][:cmd] = 'nop'
      end
      break
    end
  end
  if !changed
    @lastSwap = @rows.count + 1
  end
end

loop do
  if line >= @rows.count
    # safe exit
    puts acc
    break
  end

  if @lastSwap > @rows.count
    puts "no swappable entry found"
    break
  end

  if prevLines.include?(line)
    # hit infinite loop, reset and swap next instruction
    prevLines = []
    line = 0
    acc = 0
    swap
    next
  end

  prevLines.push line

  if @rows[line][:cmd] == 'nop'
    line += 1
  elsif @rows[line][:cmd] == 'acc'
    acc += @rows[line][:cnt]
    line += 1
  elsif @rows[line][:cmd] == 'jmp'
    line += @rows[line][:cnt]
  end
end