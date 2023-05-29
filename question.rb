class Question
  attr_reader :answer

  def initialize
    @number1 = 1 + rand(20)
    @number2 = 1 + rand(20)
    @answer = @number1 + @number2
  end

  def generate_question
    "What does #{@number1} plus #{@number2} equal?"
  end

  def check_answer(player_answer)
    player_answer == @answer  
  end
end