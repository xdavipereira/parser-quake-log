class Parser
	
	def initialize

		@file = File.open("games.log", "r")

		@file.each do |f|

			if linha_novo_jogo?(f)
				puts f + "\n"
			end
			
		end
	end


	private

	def linha_novo_jogo?(linha)
		linha.match(/(?:^|\W)InitGame(?:$|\W)/) ? true : false
	end

end


parser = Parser.new