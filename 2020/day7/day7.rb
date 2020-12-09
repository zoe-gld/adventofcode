require 'csv'

RULES = CSV.read('day7/day7_data.csv')
           .map(&:join)
           .map { |rule| rule.gsub(' ', '') }
@matches = []
@count = 0

def count_containers(bag)
  RULES.each do |rule|
    matching = rule.match(/(.*)contain.*#{Regexp.quote(bag)}/)
    next unless matching

    container = matching[1][0..-3]
    next if @matches.include?(container)

    @matches << container
    count_containers(container)
  end
  @matches.count
end

def count_bags(amount, bag)
  RULES.each do |rule|
    next unless rule.match(/^#{Regexp.quote(bag)}/)

    rule.split('bag').each do |rule_part|
      matching = rule_part.match(/.*(\d)(.*)/)
      next unless matching

      @count += amount * matching[1].to_i
      p matching
      p @count
      count_bags(matching[1].to_i, matching[2])
    end
  end
  p @count
end

count_bags(1, 'darkyellow')
