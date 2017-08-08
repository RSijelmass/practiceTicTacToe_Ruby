class Board
	attr_reader :spaces

	def initialize(spaces = ['','','','','','','','',''])
		@spaces = spaces
	end

	def fill_in(space, marker)
		check_move(space, marker)
		@spaces[space] = marker 
		@spaces
	end

	private

	def check_move(space, marker)
		raise 'This move is not allowed!'	unless (marker == 'X' || marker == 'O') && space <= @spaces.length
	end
end
