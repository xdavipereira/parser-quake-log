load 'lib/parser.rb'

	parser = Parser.new

	puts "================================================="
	puts "================================================="
	puts "================== PARSER LOG ==================="

	def exibe_informacao?
		puts "Deseja ver mais alguma informação? (S/N)"
		decisao = gets.strip
		decisao.upcase == "S" ? true : false
	end

loop do

	puts "O que você deseja ver?"
	puts "\n\n"
	puts "Digite 1 para exibir as informações de determinado jogo."
	puts "Digite 2 para exibir o relatorio de kills e causas dos abates por jogo."
	puts "Digite 3 para exibir o ranking geral de kills dos players."
	puts "Digite 4 para gerar o arquivo de relatorio dos jogos."
	puts "Digite 0 para finalizar a aplicação."


	opcao = gets
			
	puts `clear`
		
	case opcao.to_i

		when 1
			puts "Houve no total #{parser.jogos.length} jogos, você deseja ver as informações de qual jogo?"
			puts "Escolha um numero entre 1 e #{parser.jogos.length}?"
			jogo = gets

			puts `clear`

			puts "Informações sobre o jogo #{jogo.to_i}"
			parser.informacao_do_jogo(jogo.to_i)
			break !exibe_informacao?

		when 2
			parser.relatorio_dos_jogos
			break !exibe_informacao?

		when 3
			parser.ranking_geral_de_abates
			break !exibe_informacao?

		when 4
			parser.relatorio_geral
			break !exibe_informacao?
		when 0
			break
		else
		puts %{Escolha uma das tres opções:
		'1' para informações de um determinado jogo.
		'2' para relatorio de kills e as causas dos abates por jogo.
		'3' para ranking geral de kills dos players.
		'4' para criar o arquivo de relatorio com todas as informações.
		'0' para finalizar a aplicação.}
			break !exibe_informacao?
	end
end