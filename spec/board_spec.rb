require 'board'

describe Board do
	let (:board) { Board.new }

	describe 'initialise' do
		it 'initialises by default with an array of empty spaces' do
			expect(board.spaces).to eq [nil,nil,nil,nil,nil,nil,nil,nil,nil]
		end	
		it 'can initialise with a different array of spaces' do
			board2 = Board.new(4)
			expect(board2.spaces).to eq [nil,nil,nil,nil]
		end	
	end

	describe '#fill_in' do
		it 'fills in space with X' do 
			board.fill_in(1, 'X')
			expect(board.spaces).to eq [nil,'X',nil,nil,nil,nil,nil,nil,nil]
		end
		it 'fills in space with O' do 
			board.fill_in(3, 'O')
			expect(board.spaces).to eq [nil,nil,nil,'O',nil,nil,nil,nil,nil]
		end
		it 'raises an error if another marker is filled in' do
			expect { board.fill_in(0,'R') }.to raise_error 'This move is not allowed!'
		end
		it 'raises an error if filled in space is not on board' do
			expect { board.fill_in(10,'X') }.to raise_error 'This move is not allowed!'
		end
		it 'raises an error if space is already filled in' do	
	 		board.fill_in(0,'X')
			expect { board.fill_in(0,'O') }.to raise_error 'This space has already been filled!'		
	 	end
	end

	describe 'declares a horizontal win' do
		it 'declares a winner horizontal XXX on first line' do
			board.fill_in(0,'X')
			board.fill_in(1,'X')
			expect(board.fill_in(2,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner horizontal OOO on first line' do
			board.fill_in(0,'O')
			board.fill_in(1,'O')
			expect(board.fill_in(2,'O')).to eq 'Congratulations, O won!'
		end
		it 'declares a winner horizontal XXX on second line' do
			board.fill_in(3,'X')
			board.fill_in(4,'X')
			expect(board.fill_in(5,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner horizontal OOO on second line' do
			board.fill_in(3,'O')
			board.fill_in(4,'O')
			expect(board.fill_in(5,'O')).to eq 'Congratulations, O won!'
		end
		it 'declares a winner horizontal XXX on third line' do
			board.fill_in(6,'X')
			board.fill_in(7,'X')
			expect(board.fill_in(8,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner horizontal OOO on third line' do
			board.fill_in(6,'O')
			board.fill_in(7,'O')
			expect(board.fill_in(8,'O')).to eq 'Congratulations, O won!'
		end
	end

	describe 'declares a vertical win' do
		it 'declares a winner XXX on first line' do
			board.fill_in(0,'X')
			board.fill_in(3,'X')
			expect(board.fill_in(6,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner OOO on first line' do
			board.fill_in(0,'O')
			board.fill_in(1,'O')
			expect(board.fill_in(2,'O')).to eq 'Congratulations, O won!'
		end
		it 'declares a winner XXX on second line' do
			board.fill_in(1,'X')
			board.fill_in(4,'X')
			expect(board.fill_in(7,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner OOO on second line' do
			board.fill_in(1,'O')
			board.fill_in(4,'O')
			expect(board.fill_in(7,'O')).to eq 'Congratulations, O won!'
		end
		it 'declares a winner XXX on third line' do
			board.fill_in(2,'X')
			board.fill_in(5,'X')
			expect(board.fill_in(8,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner OOO on third line' do
			board.fill_in(2,'O')
			board.fill_in(5,'O')
			expect(board.fill_in(8,'O')).to eq 'Congratulations, O won!'
		end
	end
	
	describe 'declares a diagonal win' do
		it 'declares a winner XXX from top-left to bottom-right' do
			board.fill_in(0,'X')
			board.fill_in(5,'X')
			expect(board.fill_in(8,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner OOO from top-left to bottom-right' do
			board.fill_in(0,'O')
			board.fill_in(5,'O')
			expect(board.fill_in(8,'O')).to eq 'Congratulations, O won!'
		end
		it 'declares a winner XXX from top-right to bottom-left' do
			board.fill_in(2,'X')
			board.fill_in(5,'X')
			expect(board.fill_in(6,'X')).to eq 'Congratulations, X won!'
		end
		it 'declares a winner OOO from top-right to bottom-left' do
			board.fill_in(2,'O')
			board.fill_in(5,'O')
			expect(board.fill_in(6,'O')).to eq 'Congratulations, O won!'
		end
	end

	describe 'declares a tie' do
		it 'prints out a tie if the board is full' do
			for i in 0..7
				board.fill_in(i,'O')
			end
			expect(board.fill_in(8,'O')).to eq 'It\'s a tie!'
		end
	end
end
