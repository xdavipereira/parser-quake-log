load 'game.rb'
load 'player.rb'

class Parser

	attr_reader :jogos, :file
	
	def initialize

		@file = File.open("games.log", "r")

		@jogos = []

		@file.each do |f|

			if linha_novo_jogo?(f)
				@jogos << Game.new

			elsif linha_usuario?(f)
				player = Player.new obter_usuario(f)
				@jogos.last.players[player.name] = player
			end
			
		end
	end


	private
		def obter_usuario(linha)
			linha.match(/((?<=n\\).*?(?=\\t))/)[0]
		end

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

parser.jogos.each do |j|
	puts j.players.map { |key, value| "Player: #{key}" }
end
