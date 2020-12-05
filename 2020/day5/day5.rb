require 'csv'

boarding_passes = CSV.read('day5/day5_data.csv')

ids = boarding_passes.reduce([]) do |ids_array, bp|
  seat = {}
  code = bp.first.split('')
  rows = (0..127)
  code[0..6].each do |letter|
    rows =
      case letter
      when 'B'
        ((rows.first + rows.last) / 2 + 1..rows.last)
      when 'F'
        (rows.first..(rows.first + rows.last) / 2)
      end
    seat.update('row' => rows.first)
  end

  columns = (0..7)
  code[7..9].each do |letter|
    columns =
      case letter
      when 'R'
        ((columns.first + columns.last) / 2 + 1..columns.last)
      when 'L'
        (columns.first..(columns.first + columns.last) / 2)
      end
    seat.update('column' => columns.first)
  end

  ids_array << seat['row'] * 8 + seat['column']
end

(ids.min..ids.max).to_a.each do |id|
  p id unless ids.include?(id)
end
