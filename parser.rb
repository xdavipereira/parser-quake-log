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


		def linha_usuario?(linha)
			linha.match(/(?:^|\W)ClientUserinfoChanged(?:$|\W)/) ? true : false
		end


		def linha_fim_jogo?(linha)
			linha.match(/(?:^|\W)ShutdownGame(?:$|\W)/) ? true : false
		end


		def linha_kill?(linha)
			linha.match(/(?:^|\W)Kill(?:$|\W)/) ? true : false
		end

end


parser = Parser.new