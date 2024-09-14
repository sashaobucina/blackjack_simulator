require_relative "game_runner"

class Simulation
  class << self
    def run(num_times: 1000)
      ties = 0
      player_wins = 0
      dealer_wins = 0

      num_times.times do
        game_runner = GameRunner.new
        results = game_runner.run

        results.each do |result|
          if result.player_won?
            player_wins += 1
          elsif result.dealer_won?
            dealer_wins += 1
          elsif result.tie?
            ties += 1
          end
        end
      end

      puts "Player wins: #{player_wins} / #{num_times}"
      puts "Dealer wins: #{dealer_wins} / #{num_times}"
      puts "Ties: #{ties} / #{num_times}"
      puts "————————————————————————————————————————————————————"
      puts "Player win percentage: #{((player_wins.to_f / num_times) * 100).round(2)}%"
      puts "Dealer win percentage: #{((dealer_wins.to_f / num_times) * 100).round(2)}%"
      puts "Tie percentage: #{((ties.to_f / num_times) * 100).round(2)}%"
    end
  end
end

num_times = ARGV.empty? ? 1000 : ARGV[0].to_i

puts "Running #{num_times} game simulations..."

Simulation.run(num_times: num_times)