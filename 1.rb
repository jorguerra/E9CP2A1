class Table
  attr_accessor :income
  def initialize(name, *income)
    @name = name
    @income = income.map(&:to_i)
  end

  def best_day
    day = @income.index(@income.max) + 1
    "El mejor día de la #{@name} fue el #{day.to_s} con #{@income.max.to_s}"
  end

  def avg
    @income.sum/@income.length unless @income.length.zero?
  end
end

tables = []
data = File.open('casino.txt', 'r') { |file| file.readlines }
data.each do |table_string|
  values = table_string.split(',').map(&:chomp)
  tables << Table.new(*values)
end

averages = []

tables.each do |table|
  table.income.each_with_index do |value, index|
    averages[index] = [] if averages[index].nil?
    averages[index] << value
  end
  puts table.best_day
  puts "El promedio es #{table.avg}"
end

print averages
averages.each_with_index do |average, k|
  puts "El promedio del día #{k+1} fue " + (average.sum/average.length).to_s
end
