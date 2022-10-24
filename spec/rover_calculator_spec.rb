require 'rover_calculator'

RSpec.describe RoverCalculator do

  before do
    @square = { x: 5, y: 5 }
  end

  context 'move with given example test data' do
    it "position output '1 3 N' from input '1 2 N' and 'LMLMLMLMM'" do
      output = RoverCalculator.move(@square, '1 2 N', 'LMLMLMLMM')

      expect(output).to eq('1 3 N')
    end

    it "position output '5 1 E' from input '3 3 E' and 'MMRMMRMRRM'" do
      output = RoverCalculator.move(@square, '3 3 E', 'MMRMMRMRRM')

      expect(output).to eq('5 1 E')
    end
  end
end