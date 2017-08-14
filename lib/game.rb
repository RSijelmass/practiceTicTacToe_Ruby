require_relative 'board'

class Game

	def initialize(board = Board.new)
		@board = board
		@marker = 'X'
	end
	
	def play(space)
		@board.fill_in(space, @marker)
		return @board.check_win(@marker) if @board.check_win(@marker)
		switch_player
		print_board
	end

	private

	def switch_player
		@marker == 'X' ? (@marker = 'O') : (@marker = 'X')
	end

	def	print_board
		@board.spaces.map! { |space| space ? (space) : (space = " ") } 
		puts print_line(@board.spaces[0..2]) + "\n- - -\n" + print_line(@board.spaces[3..5]) + "\n- - -\n" + print_line(@board.spaces[6..8])
	end

	def print_line(spaces)
		 "#{spaces[0]}|#{spaces[1]}|#{spaces[2]}"
	end
end
