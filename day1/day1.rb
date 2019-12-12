require 'csv'

lines = CSV.read('day1_data.csv')

solution = []

lines.each do |line|
  fuel = []
  fuel << (line.first.to_i / 3) - 2
  i = 0
  while (fuel[i] / 3) > 2 do
    fuel << (fuel[i] / 3) - 2
    i += 1
  end
  solution << fuel.sum
end

p lines[0]
p solution.sum
