rows = File.open("../input/passport_data.txt").readlines.map{|i| i.strip}
passports = []
passport = {}

rows.each do |r|
  if r.length > 0
    elements = r.split(' ')
    elements.each do |e|
      element = e.split(':')
      passport[element[0]] = element[1]
    end
  else
    passports.push(passport)
    passport = {}
  end
end

passports.map do |x|
  valid = true
  valid = false unless (x.count === 8 || (x.count === 7 && !x.key?("cid")))
  valid = false unless valid && (x["byr"].to_i >= 1920 && x["byr"].to_i <= 2002)
  valid = false unless valid && (x["iyr"].to_i >= 2010 && x["iyr"].to_i <= 2020)
  valid = false unless valid && (x["eyr"].to_i >= 2020 && x["eyr"].to_i <= 2030)
  valid = false unless valid && (
    (x["hgt"] =~ /in/i && x["hgt"][0..-3].to_i >= 59 && x["hgt"][0..-3].to_i <= 76) ||
    (x["hgt"] =~ /cm/i && x["hgt"][0..-3].to_i >= 150 && x["hgt"][0..-3].to_i <= 193)
  )
  valid = false unless valid && !!(x["hcl"].length === 7 && x["hcl"][0] === "#" && x["hcl"][1..-1] =~ /^[0-9a-f]+$/i)
  valid = false unless valid && (['amb','blu','brn','gry','grn','hzl','oth'].include? x["ecl"])
  valid = false unless valid && (x["pid"].length === 9 && x["pid"].to_i != 0)
  x["valid"] = valid
end

puts passports.select { |x| x["valid"] === true }.count