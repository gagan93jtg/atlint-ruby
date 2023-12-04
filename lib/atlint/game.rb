module Atlint
  class Game
    attr_accessor :running, :snake, :board
    DIRECTIONS = [:top, :left, :bottom, :right]

    def initialize(snake, board)
      self.running = true
      self.snake = snake
      self.board = board
    end

    def move_snake(direction)
      snake.move(direction)
      game_over?
    end

    def game_over?
      snake.positions.length != snake.positions.uniq.length
    end
  end
end
