class Board
	attr_reader :spaces

	def initialize(spaces = ['','','','','','','','',''])
		@spaces = spaces
	end

	def fill_in(space, move)
		check_move(move)
		@spaces[space] = move
		@spaces
	end

	private

	def check_move(move)
		raise 'This move is not allowed!' unless move == 'X' || move == 'O'
	end
end
