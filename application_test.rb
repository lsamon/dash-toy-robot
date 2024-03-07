require "spec_helper"
require_relative "../application"

describe Application do
  let(:board) { instance_double(Board) }
  let(:robot) { instance_double(Robot) }
  let(:command_processor) { instance_double(CommandProcessor) }
  subject(:application) { described_class.new(board) }

  describe "#call" do
    before do
      allow(board).to receive(:new).and_return(board)
      allow(robot).to receive(:new).with(board).and_return(robot)
      allow(CommandProcessor).to receive(:new).with(robot).and_return(command_processor)
      allow(application).to receive(:puts)
      allow(application).to receive(:print)
      allow(application).to receive(:gets).and_return("PLACE 0,0,NORTH", "MOVE", "REPORT", "exit")
      allow(robot).to receive(:not_placed?).and_return(false)
      allow(robot).to receive(:report).and_return("0,0,NORTH")
      allow(command_processor).to receive(:call)
    end

    it "displays welcome message" do
      expect(application).to receive(:puts).with("#############################################")
      expect(application).to receive(:puts).with("Welcome to Toy Robot Simulator!")
      expect(application).to receive(:puts).with("#############################################")
      expect(application).to receive(:puts).exactly(5).times
      application.call
    end

    it "prompts for commands and processes them" do
      expect(application).to receive(:print).with("Enter commands to control the robot: ").exactly(4).times
      expect(application).to receive(:gets).and_return("PLACE 0,0,NORTH", "MOVE", "REPORT", "exit").exactly(4).times
      expect(command_processor).to receive(:call).with("PLACE 0,0,NORTH")
      expect(command_processor).to receive(:call).with("MOVE")
      expect(command_processor).to receive(:call).with("REPORT")
      application.call
    end

    it "exits the application when 'exit' command is entered" do
      expect(application).to receive(:gets).and_return("exit")
      expect(application).to receive(:puts).with("Goodbye!")
      application.call
    end

    it "skips processing commands if robot is not placed and first command is not 'PLACE'" do
      allow(robot).to receive(:not_placed?).and_return(true)
      expect(application).to receive(:gets).and_return("MOVE", "exit")
      expect(application).to receive(:puts).with("The first command must be PLACE")
      expect(command_processor).not_to receive(:call)
      application.call
    end

    it "displays the robot's report when 'REPORT' command is entered" do
      expect(application).to receive(:gets).and_return("REPORT", "exit")
      expect(robot).to receive(:report).and_return("0,0,NORTH")
      expect(application).to receive(:puts).with("0,0,NORTH")
      application.call
    end
  end
end
