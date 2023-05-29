class Player
  attr_reader :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3

  end

  def lose_life
    @lives -= 1
  end

  def display_lives
    puts "#{name}: #{lives}/3"
    
  end
end