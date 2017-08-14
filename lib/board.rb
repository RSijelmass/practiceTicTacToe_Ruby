class Board
	attr_reader :spaces

	def initialize(space_length = 9)
		@spaces = Array.new(space_length)
	end

	def fill_in(space, marker)
		check_move(space, marker)
		@spaces[space] = marker 
		find_win(marker) ? find_win(marker) : @spaces
	end

	def find_win(marker)
		return check_tie if check_tie
		return check_win(marker) if check_win(marker)
		return nil
	end

	private

	def check_move(space, marker)
		raise 'This move is not allowed!'	unless is_allowed?(space, marker)
		raise 'This space has already been filled!' if is_filled?(space)
	end
	
	def check_tie
		return "It's a tie!" if is_full_board?
	end

	def check_win(marker)
		combinations = horizontal_combinations + vertical_combinations + diagonal_combinations
		combinations.each do |combination|
			return "Congratulations, #{marker} won!" if combination == [marker, marker, marker]
		end
	end

	def is_filled?(space)
		@spaces[space] != nil && @spaces[space] != " "
	end

	def is_allowed?(space, marker)
		(marker == 'X' || marker == 'O') && space < @spaces.length
	end

	def is_full_board?
		!@spaces.include?(" ") && !@spaces.include?(nil)
	end
	
	def horizontal_combinations
		[@spaces[0..2], @spaces[3..5], @spaces[6..8]]
	end

	def vertical_combinations
		[[@spaces[0], @spaces[3], @spaces[6]], [@spaces[1], @spaces[4], @spaces[7]], [@spaces[2], @spaces[5], @spaces[8]]]
	end

	def diagonal_combinations
		[[@spaces[0], @spaces[5], @spaces[8]], [@spaces[2], @spaces[5], @spaces[6]]]
	end

end
