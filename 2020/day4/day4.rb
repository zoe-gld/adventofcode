require 'csv'

def check_years_validity(passport)
  /^\d{4}$/.match(passport['byr']) &&
    passport['byr'].to_i.between?(1920, 2002) &&
    /^\d{4}$/.match(passport['iyr']) &&
    passport['iyr'].to_i.between?(2010, 2020) &&
    /^\d{4}$/.match(passport['eyr']) &&
    passport['eyr'].to_i.between?(2020, 2030)
end

passports = CSV.read('day4/day4_data.csv')
               .join(' ').split('  ')
               .map { |pass| pass.split(' ').map { |subpass| subpass.split(':') } }
               .map(&:to_h)

fields = %w[byr iyr eyr hgt hcl ecl pid]

valid_pass = passports.filter do |pass|
  fields.reduce(true) { |result, field| result && pass.keys.include?(field) }
end

validity_counter = 0

valid_pass.each do |passport|
  years_validity = check_years_validity(passport)

  height_param = /^(\d+)(in|cm)$/.match(passport['hgt'])

  height_validity =
    if height_param.nil?
      false
    elsif height_param[2] == 'cm'
      height_param[1].to_i.between?(150, 193)
    elsif height_param[2] == 'in'
      height_param[1].to_i.between?(59, 76)
    end

  hcl_validity = /^#([0-9a-f]{6})$/.match(passport['hcl'])

  ecl_validity = %w[amb blu brn gry grn hzl oth].include?(passport['ecl'])

  pid_validity = /^\d{9}$/.match(passport['pid'])

  if years_validity && height_validity && hcl_validity && ecl_validity && pid_validity
    validity_counter += 1
  end
end

p validity_counter
