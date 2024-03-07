require 'rspec'
require_relative '../lib/command_processor'
require_relative '../lib/robot'

describe CommandProcessor do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new(board) }
  let(:command_processor) { CommandProcessor.new(robot) }

  describe '#call' do
    context 'when the command is PLACE' do
      it 'places the robot on the board if it is not already placed' do
        expect(robot).to receive(:placed?).and_return(false)
        expect(robot).to receive(:place).with(1, 2, 'NORTH')

        command_processor.call('PLACE 1,2,NORTH')
      end

      it 'does not place the robot on the board if it is already placed' do
        expect(robot).to receive(:placed?).and_return(true)
        expect(robot).not_to receive(:place)

        command_processor.call('PLACE 1,2,NORTH')
      end
    end

    context 'when the command is MOVE' do
      it 'should move the robot by one unit in a specific direction' do
        expect(robot).to receive(:move)

        command_processor.call('MOVE')
      end
    end

    context 'when the command is LEFT' do
      it 'should rotate the robot 90 degrees to the left' do
        expect(robot).to receive(:left)

        command_processor.call('LEFT')
      end
    end

    context 'when the command is RIGHT' do
      it 'rotates the robot 90 degrees to the right' do
        expect(robot).to receive(:right)

        command_processor.call('RIGHT')
      end
    end

    context 'when the command is REPORT' do
      it 'should return the current position and direction of the robot' do
        expect(robot).to receive(:report)

        command_processor.call('REPORT')
      end
    end

    context 'when the command is invalid' do
      it 'prints an error message' do
        expect { command_processor.call('INVALID') }.to output("Invalid command: INVALID\n").to_stdout
      end
    end
  end
end
