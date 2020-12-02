require_relative 'day1_data'

sorted = DATA.sort
sorted.each do |number|
  sorted.each do |num2|
    solution = sorted.find { |num| num + num2 + number == 2020 }
    p solution unless solution.nil?
    break
  end
end
