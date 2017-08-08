class Board
	attr_reader :spaces

	def initialize(space_length = 9)
		@spaces = Array.new(space_length)
	end

	def fill_in(space, marker)
		check_move(space, marker)
		@spaces[space] = marker 
		check_win(marker) ? check_win(marker) : @spaces
	end

	private

	def check_move(space, marker)
		raise 'This move is not allowed!'	unless is_allowed?(space, marker)
		raise 'This space has already been filled!' if is_filled?(space)
	end
	
	def is_filled?(space)
		@spaces[space] != nil
	end

	def is_allowed?(space, marker)
		(marker == 'X' || marker == 'O') && space < @spaces.length
	end

	def check_win(marker)
		return 'Congratulations, X won!' if @spaces[0..2] == ['X','X','X']
	end
end
