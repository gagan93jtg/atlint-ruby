module Atlint
  class Snake
    attr_accessor :positions, :snake_size, :board_size, :current_growth

    def initialize(snake_size, board_size)
      self.snake_size = snake_size
      self.board_size = board_size
      self.positions = []
      self.current_growth = 0
      snake_size.times do |pos|
        positions << "0,#{pos}"
      end
    end

    def move(direction)
      if current_growth == 5
        step = 2
        self.current_growth = 0
      else
        step = 1
      end

      if direction == :top
        move_top(step)
      elsif direction == :left
        move_left(step)
      elsif direction == :right
        move_right(step)
      elsif
        move_below(step)
      end

      self.current_growth += 1
    end

    private def move_top(step)
      last_position_x, last_position_y = positions[-1].split(",").map(&:to_i)
      next_position_x = last_position_x
      next_position_y = last_position_y - step
      next_position_y = board_size + next_position_y if next_position_y < 0
      next_position = "#{next_position_x},#{next_position_y}"
      positions.shift
      positions << next_position
    end

    private def move_left(step)
      last_position_x, last_position_y = positions[-1].split(",").map(&:to_i)
      next_position_x = last_position_x - step
      next_position_x = board_size + next_position_x if next_position_x < 0
      next_position_y = last_position_y
      next_position = "#{next_position_x},#{next_position_y}"
      positions.shift
      positions << next_position
    end

    private def move_right(step)
      last_position_x, last_position_y = positions[-1].split(",").map(&:to_i)
      next_position_x = (last_position_x + step) % board_size
      next_position_y = last_position_y
      next_position = "#{next_position_x},#{next_position_y}"
      positions.shift
      positions << next_position
    end

    private def move_below(step)
      last_position_x, last_position_y = positions[-1].split(",").map(&:to_i)
      next_position_x = last_position_x
      next_position_y = (last_position_y + step) % board_size
      next_position = "#{next_position_x},#{next_position_y}"
      positions.shift
      positions << next_position
    end
  end
end
