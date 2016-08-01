load 'lib/parser.rb'

	puts "================================================="
	puts "================================================="
	puts "================== PARSER LOG ==================="
	puts "O que você deseja ver?"
	puts "\n\n"
	puts "Digite 1 para exibir as informções de determinado jogo."
	puts "Digite 2 para exibir o relatorio de kills e causas dos abates por jogo."
	puts "Digite 3 para exibir o ranking geral de kills dos players."
	puts "Digite 4 para gerar o arquivo de relatorio dos jogos."

	opcao = gets
		
	puts `clear`
	

	parser = Parser.new
	
	case opcao.to_i

	when 1
		puts "Houve no total #{parser.jogos.length} jogos, você deseja ver as informações de qual jogo?"
		puts "Escolha um numero entre 1 e #{parser.jogos.length}?"
		jogo = gets

		puts `clear`

		puts "Informações sobre o jogo #{jogo.to_i}"
		parser.informacao_do_jogo(jogo.to_i)

	when 2
		parser.relatorio_dos_jogos
	when 3
		parser.ranking_geral_de_abates
	when 4
		parser.relatorio_geral
	else
		puts %{Escolha uma das tres opções:
		'1' para informações de um determinado jogo.
		'2' para relatorio de kills e as causas dos abates por jogo.
		'3' para ranking geral de kills dos players.
		'4' para criar o arquivo de relatorio com todas as informações.}
	end
