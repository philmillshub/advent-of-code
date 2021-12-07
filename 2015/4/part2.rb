require 'digest/md5'
input = File.open("input.txt").readlines.first.strip

found = false

val = 1

loop do
  str = "#{input}#{val.to_s}"
  hash = Digest::MD5.new << str
  break if hash.to_s[0..5] === "000000"
  val += 1
end

puts val