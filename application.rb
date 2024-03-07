require_relative 'lib/robot'
require_relative 'lib/board'
require_relative 'lib/command_processor'

class Application
  attr_reader :board, :robot, :command_processor

  def initialize(board = Board.new)
    @board = board
    @robot = Robot.new(@board)
    @command_processor = CommandProcessor.new(@robot)
  end

  def call
    puts "#############################################"
    puts 'Welcome to Toy Robot Simulator!'
    puts "#############################################"
    puts
    puts 'Commands:'
    puts 'PLACE X,Y,F | MOVE | LEFT | RIGHT | REPORT'
    puts 'Example: PLACE 0,0,NORTH | MOVE | MOVE | LEFT | MOVE | REPORT'
    puts
    puts 'Type "exit" or "Ctrl C" to quit the application'
    puts

    loop do
      print 'Enter commands to control the robot: '

      input = gets.chomp
      command, *args = input.split

      if command == 'exit'
        puts "\nGoodbye!"
        break
      end

      if robot.not_placed? && command != 'PLACE'
        puts 'The first command must be PLACE'
        next
      end

      if command == 'REPORT'
        puts robot.report

        break
      end

      command_processor.call(input)
    rescue SignalException
      puts "\n\nGoodbye!"
      break
    end
  end
end

Application.new.call
