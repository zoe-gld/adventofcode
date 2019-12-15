# require 'byebug'

range = (347312..805915)

def increasing_digits?(number)
  split = number.digits.reverse
  (0...split.length - 1).to_a.map { |i| (split[i+1] >= split[i]) }.all?
end

def same_digits?(number)
  split = number.digits.reverse
  check = []
  count = 1
  for i in (0..split.length - 1) do
    if split[i + 1] == split[i]
      count += 1
    else
      check << count
      count = 1
    end
  end
  check.include?(2)
end

i = 0
range.to_a.each do |number|
  i+= 1 if increasing_digits?(number) && same_digits?(number)
end

p "La solution est #{i}."
