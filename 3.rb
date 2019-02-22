class Roulette
  def initialize
    @r = (1..10).to_a
  end

  def play(bet)
    random = @r.sample
    puts random
    store(random, bet)
    puts random == bet ? 'Ganaste' : 'Perdiste'
    random == bet
  end

  def store(random, bet)
    write_in_file('roulette_history.txt', random)
    write_in_file('winners.txt', bet) if bet == random
  end

  def write_in_file(file, content)
    file = File.open(file, 'a')
    file.puts content
    file.close
  end

  def most_repeated
    data = []
    (0..10).to_a.each { |i| data[i] = 0 }
    data_file = File.open('roulette_history.txt', 'r'){ |file| file.readlines }
    data_file.each do |line|
      data[line.to_i] += 1
    end
    data.index data.max
  end
end
