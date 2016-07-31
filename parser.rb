class Parser
	def initialize
		
		@file = File.open("games.log", "r")

		file.each do |f|

			puts f
			
		end
	end

end


parser = Parser.new