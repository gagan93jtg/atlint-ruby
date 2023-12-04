module Atlint
  class Runner
    attr_accessor :snake, :board, :game

    def initialize(board_size:, snake_initial_size:)
      self.snake = Atlint::Snake.new(snake_initial_size, board_size)
      self.board = Atlint::Board.new(board_size)
      self.game = Atlint::Game.new(snake, board)
    end
  end
end


# runner = Atlint::Runner.new(board_size: 10, snake_initial_size: 3)
# runner.game.move_snake(:right)

# right, right, down, left, up
