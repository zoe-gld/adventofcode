require 'csv'

content = CSV.read('2020/day3/day3_data.csv')
position1 = 3
position2 = 1
position3 = 5
position4 = 7
position5 = 1
tree_counter1 = 0
tree_counter2 = 0
tree_counter3 = 0
tree_counter4 = 0
tree_counter5 = 0

content[1..content.length].each do |line|
  tree_counter1 +=1 if line.first[position1%31] == "#"
  position1 += 3
end

content[1..content.length].each do |line|
  tree_counter2 +=1 if line.first[position2%31] == "#"
  position2 += 1
end

content[1..content.length].each do |line|
  tree_counter3 +=1 if line.first[position3%31] == "#"
  position3 += 5
end

content[1..content.length].each do |line|
  tree_counter4 +=1 if line.first[position4%31] == "#"
  position4 += 7
end

content[2..content.length].each_with_index do |line, idx|
  if idx.even?
    tree_counter5 +=1 if line.first[position5%31] == "#"
    position5 += 1
  end
end

p tree_counter1 * tree_counter2 * tree_counter3 * tree_counter4 * tree_counter5
