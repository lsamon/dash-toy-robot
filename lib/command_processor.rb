class CommandProcessor
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def call(input)
    command, *args = input.split

    case command
    when 'PLACE'
      return if robot.placed?

      x, y, direction = args.first.split(',')
      robot.place(x.to_i, y.to_i, direction)
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
    else
      puts "Invalid command: #{command}"
    end
  end
end
