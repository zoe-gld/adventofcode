require 'csv'

lines = CSV.read('data.csv')

solution = []

lines.each do |line|
  fuel = []
  fuel << (line.first.to_f / 3).truncate - 2
  i = 0
  while (fuel[i].to_f / 3).truncate > 2 do
    fuel << (fuel[i].to_f / 3).truncate - 2
    i += 1
  end
  solution << fuel.sum
end

p solution.sum
