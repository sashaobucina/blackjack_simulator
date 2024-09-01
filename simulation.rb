require_relative "game_runner"

class Simulation
  class << self
    def run(num_times: 1000)
      ties = 0
      player_wins = 0
      dealer_wins = 0

      num_times.times do
        game_runner = GameRunner.new

        win_result = game_runner.run_once

        if win_result.player_won?
          player_wins += 1
        elsif win_result.dealer_won?
          dealer_wins += 1
        elsif win_result.tie?
          ties += 1
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