require 'rspec'
require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'should set the default width and height to 5' do
      expect(board.width).to eq(5)
      expect(board.height).to eq(5)
    end

    it 'should set the custom width and height if provided' do
      custom_board = Board.new(10, 8)
      expect(custom_board.width).to eq(10)
      expect(custom_board.height).to eq(8)
    end
  end

  describe '#valid_position?' do
    it 'should return true for valid positions' do
      expect(board.valid_position?(3, 4)).to be true
      expect(board.valid_position?(0, 0)).to be true
      expect(board.valid_position?(4, 2)).to be true
    end

    it 'should return false for outbound positions' do
      expect(board.valid_position?(-1, 2)).to be false
      expect(board.valid_position?(3, 6)).to be false
      expect(board.valid_position?(5, 4)).to be false
    end
  end
end
