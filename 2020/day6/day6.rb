require 'csv'

groups = CSV.read('day6/day6_data.csv').join(' ').split('  ')

common_answers = groups.map do |group|
  answers = group.split(' ')
  answers[0].split('').reduce(0) do |count, letter|
    answers.all? { |answer| answer.include?(letter) } ? count += 1 : count
  end
end

p common_answers.sum
