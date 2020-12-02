require 'csv'

counter = 0

CSV.read('2020/day2/day2_data.csv').each do |line|
  rule = line.first.split(' ')
  range = rule.first.split('-').map(&:to_i)
  letter = rule[1][0]
  password = rule.last
  count = 0
  count += 1 if password[range.first - 1] == letter
  count += 1 if password[range.last - 1] == letter
  validity = count == 1
  counter += 1 if validity
end

p counter
