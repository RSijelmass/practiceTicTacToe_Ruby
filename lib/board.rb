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
		combinations = horizontal_combinations + vertical_combinations + diagonal_combinations
		combinations.each do |combination|
			return "Congratulations, #{marker} won!" if combination == [marker, marker, marker]
		end
		return nil
	end

	def horizontal_combinations
		[@spaces[0..2], @spaces[3..5], @spaces[6..8]]
	end

	def vertical_combinations
		[[@spaces[0], @spaces[3], @spaces[6]], [@spaces[1], @spaces[4], @spaces[7]], [@spaces[2], @spaces[5], @spaces[8]]]
	end

	def diagonal_combinations
		[[@spaces[0], @spaces[5], @spaces[8]]]
	end

end
