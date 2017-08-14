require 'game'

describe Game do
	let(:board) { double(:board, fill_in: ['X', nil, nil, nil, nil, nil, nil, nil, nil], check_win: nil, spaces: ['X', nil, nil, nil, nil, nil, nil, nil, nil]) }
	let(:game) { Game.new(board) }

	describe '#play' do
		it 'fills in a space on the board' do
			expect(board).to receive(:fill_in)
			game.play(0)
		end
		it 'returns a winner if someone won' do
			expect(board).to receive(:check_win)
			game.play(0)
		end
	end

	describe 'prints the board' do
		it 'prints the board after a play in a roster' do
			expect { game.play(1) }.to output("X| | \n- - -\n | | \n- - -\n | | \n").to_stdout
		end
	end

end
