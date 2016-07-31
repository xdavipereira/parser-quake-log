class Game
	attr_accessor :total_kills, :players
	attr_reader :id

	@@id_jogo = 0

	def initialize()
		@id = @@id_jogo +=1

		@total_kills = 0
		
		@players = Hash.new

	end


	def adicionar_kill
		@total_kills +=1
	end

end