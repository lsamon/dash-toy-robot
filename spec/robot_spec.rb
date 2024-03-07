require 'rspec'
require_relative '../lib/robot'
require_relative '../lib/board'

describe Robot do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new(board) }

  describe '#place' do
    it 'places the robot on the board in a valid position' do
      robot.place(1, 2, 'NORTH')
      expect(robot.report).to eq("1,2,NORTH")
    end

    it 'does not place the robot on the board in an invalid position' do
      robot.place(6, 6, 'NORTH')
      expect(robot.report).to be_nil
    end
  end

  describe '#placed?' do
    it 'returns true if the robot is placed on the board' do
      robot.place(1, 2, 'NORTH')
      expect(robot.placed?).to be true
    end

    it 'returns false if the robot is not placed on the board' do
      expect(robot.placed?).to be false
    end
  end

  describe '#move' do
    it 'moves the robot one unit forward in the current direction' do
      robot.place(1, 2, 'NORTH')
      robot.move
      expect(robot.report).to eq("1,3,NORTH")
    end

    it 'does not move the robot if it is not placed on the board' do
      robot.move
      expect(robot.report).to be_nil
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees to the left' do
      robot.place(1, 2, 'NORTH')
      robot.left
      expect(robot.report).to eq("1,2,WEST")
    end

    it 'does not rotate the robot if it is not placed on the board' do
      robot.left
      expect(robot.report).to be_nil
    end
  end

  describe '#right' do
    it 'rotates the robot 90 degrees to the right' do
      robot.place(1, 2, 'NORTH')
      robot.right
      expect(robot.report).to eq("1,2,EAST")
    end

    it 'does not rotate the robot if it is not placed on the board' do
      robot.right
      expect(robot.report).to be_nil
    end
  end

  describe '#report' do
    it 'returns the current position and direction of the robot' do
      robot.place(1, 2, 'NORTH')
      expect(robot.report).to eq("1,2,NORTH")
    end

    it 'returns nil if the robot is not placed on the board' do
      expect(robot.report).to be_nil
    end
  end
end
