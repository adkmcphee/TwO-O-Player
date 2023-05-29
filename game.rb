require_relative 'players'
require_relative 'question'


class Game
  def initialize(num_players)
    @players = []
    num_players.times do |i|
      puts "Enter the name for Player #{i + 1}:"
      player_name = gets.chomp
      @players << Player.new(player_name)
    end
  end

  def start_game
    until game_over?
      puts '--- NEW TURN ---'
      current_player = @players[0]
      question = Question.new
      question.generate_question
      puts "#{current_player.name}: #{question.generate_question}"
      player_answer = gets.chomp.to_i
      if question.check_answer(player_answer)
        puts "#{current_player.name}: Yes! You are correct."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
      @players.rotate!
    end
    announce_winner
  end

private

  def game_over?
    @players.any? { |player| player.lives.zero? }
  end


  def announce_winner
    winner = @players.max_by(&:lives)
    puts "#{winner.name} wins with #{winner.lives}/3 lives remaining"
  end
end