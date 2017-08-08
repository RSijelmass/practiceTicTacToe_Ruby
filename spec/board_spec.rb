require 'board'

describe Board do
	let (:board) { Board.new }

	describe 'initialise' do
		it 'initialises by default with an array of empty spaces' do
			expect(board.spaces).to eq ['','','','','','','','','']
		end	
		it 'can initialise with a different array of spaces' do
			board2 = Board.new(['a','b','c','d','e','f','g','h','i'])
			expect(board2.spaces).to eq ['a','b','c','d','e','f','g','h','i']
		end	
	end

	describe '#fill_in' do
		it 'fills in space with X' do 
			expect(board.fill_in(1, 'X')).to eq ['','X','','','','','','','']
		end
		it 'fills in space with O' do 
			expect(board.fill_in(3, 'O')).to eq ['','','','O','','','','','']
		end
		it 'raises an error if another marker is filled in' do
			expect { board.fill_in(0,'R') }.to raise_error 'This move is not allowed!'
		end
		it 'raises an error if filled in space is not on board' do
			expect { board.fill_in(10,'X') }.to raise_error 'This move is not allowed!'
		end
end
end
