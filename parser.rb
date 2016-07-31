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

			elsif linha_kill?(f)
				@jogos.last.adicionar_kill
				assasino = obter_assasino(f) 
				vitima = obter_vitima(f)

				if assasino != "<world>"
					@jogos.last.players[assasino].adicionar_score
				else 
					@jogos.last.players[vitima].subtrair_score 
				end
			
			end			
		end
	end


	private
		def obter_usuario(linha)
			linha.match(/((?<=n\\).*?(?=\\t))/)[0]
		end

		def obter_assasino(linha)
			linha.match(/([^:]+).(?=\skilled)/)[0].strip
		end


		def obter_vitima(linha)
			linha.match(/((?<=killed\s).*(?=\sby))/)[0]
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
	puts j.total_kills
	puts j.players.map { |key, value| "Player: #{key} #{value.score} Kills" }
end
