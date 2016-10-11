module MathGame
  class Player
    DEFAULT_LIVES = 3

    attr_accessor :name, :lives

    def initialize(name)
      @name = name
      @lives = DEFAULT_LIVES
    end

    def decrease_life
      @lives -= 1
    end
  end
end
