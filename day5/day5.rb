loop do
  if puzzle[i] == 1
    puzzle[puzzle[i+3]] = puzzle[puzzle[i+1]] + puzzle[puzzle[i+2]]
  elsif puzzle[i] == 2
    puzzle[puzzle[i+3]] = puzzle[puzzle[i+1]] * puzzle[puzzle[i+2]]
  end
  i += 4
  break if puzzle[i] == 99
end
