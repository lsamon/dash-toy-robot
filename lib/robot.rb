class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :board

  def initialize(board)
    @board = board
    @x = @y = @direction = nil
  end

  def place(x, y, direction)
    if board.valid_position?(x, y) && DIRECTIONS.include?(direction)
      @x, @y, @direction = x, y, direction
    end
  end

  def not_placed?
    @x.nil? && @y.nil? && @direction.nil?
  end

  def placed?
    !not_placed?
  end

  def move
    return if not_placed?

    case @direction
    when 'NORTH'
      @y += 1 if board.valid_position?(@x, @y + 1)
    when 'EAST'
      @x += 1 if board.valid_position?(@x + 1, @y)
    when 'SOUTH'
      @y -= 1 if board.valid_position?(@x, @y - 1)
    when 'WEST'
      @x -= 1 if board.valid_position?(@x - 1, @y)
    end
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
end
