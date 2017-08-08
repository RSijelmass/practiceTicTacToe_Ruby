class Board
	attr_reader :spaces

	def initialize(spaces = ['','','','','','','','',''])
		@spaces = spaces
	end

	def fill_in(space, move)
		@spaces[space] = move
		@spaces
	end

end
