class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :board

  def initialize(board)
    @board = board
    @x = @y = @direction = nil
    @placed = false
  end

  def place(x, y, direction)
    if board.valid_position?(x, y) && DIRECTIONS.include?(direction)
      @x, @y, @direction = x, y, direction
      @placed = true
    end
  end

  def not_placed?
    !@placed
  end

  def placed?
    @placed
  end

  def move
    return if not_placed?

    move_direction = move_methods.fetch(@direction, nil)
    move_direction&.call
  end

  def left
    return if not_placed?

    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index - 1) % DIRECTIONS.length]
  end

  def right
    return if not_placed?

    current_index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(current_index + 1) % DIRECTIONS.length]
  end

  def report
    return if not_placed?

    "#{@x},#{@y},#{@direction}"
  end

  private

  def move_methods
    {
      'NORTH' => Proc.new { move_north },
      'EAST'  => Proc.new { move_east },
      'SOUTH' => Proc.new { move_south },
      'WEST'  => Proc.new { move_west }
    }
  end

  def move_north
    return unless board.valid_position?(@x, @y + 1)

    @y += 1
  end

  def move_east
    return unless board.valid_position?(@x + 1, @y)

    @x += 1
  end

  def move_south
    return unless board.valid_position?(@x, @y - 1)

    @y -= 1
  end

  def move_west
    return unless board.valid_position?(@x - 1, @y)

    @x -= 1
  end
end
