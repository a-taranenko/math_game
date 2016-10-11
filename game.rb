module MathGame
  class Game
    attr_accessor :player1, :player2

    def initialize(player1, player2)
      @player1 = Player.new(player1)
      @player2 = Player.new(player2)
      @current_player = @player1
    end

    def switch_player
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
    end

    def ask_question
      question = Question.new
      puts question.generate_question(@current_player.name)
      print "> "
      answer = gets.chomp.to_i

      check_answer(answer, question)
    end

    def check_answer(answer, question)
      if answer == question.number1 + question.number2
        puts "Correct!"
      else
        if @current_player == @player1
          @player1.decrease_life
          puts "#{@player1.name}, you are incorrect!"
        else
          @player2.decrease_life
          puts "#{@player2.name}, you are incorrect!"
        end
      end
    end

    def check_player_lives
      if @player1.lives > 0 && @player2.lives > 0
        puts "#{@player1.name}: #{@player1.lives}/3 VS #{@player2.name}: #{@player2.lives}/3"
        puts "----- NEW TURN -----"
      else
        puts "#{@current_player.name} you win with a score of #{@current_player.lives}/3!!!"
      end
    end

    def start_game
      while @player1.lives > 0 && @player2.lives > 0 do
        ask_question
        switch_player
        check_player_lives
      end

      puts "----- GAME OVER -----"
    end
  end
end
