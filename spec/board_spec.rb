require 'board'

describe Board do
	let (:board) { Board.new }

	describe 'initialise' do
		it 'initialises by default with an array of empty spaces' do
			expect(board.spaces).to eq ['','','','','','','','','']
		end	
		it 'can initialise with an different array of spaces' do
			board2 = Board.new(['a','b','c','d','e','f','g','h','i'])
			expect(board2.spaces).to eq ['a','b','c','d','e','f','g','h','i']
		end	end
end
