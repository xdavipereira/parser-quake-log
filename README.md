# Parser Quake Log
Parser dos logs do jogo Quake Arena  3


##Como iniciar a aplicação?

Execute o comando :
`ruby parser-log.rb`


##Instruções
Ao iniciar a aplicação, um menu de opções é exibido, com as instruções para a visualização das informações colhidas do arquivo games.log


###Menu
- Digite 1 para exibir as informações de determinado jogo
- Digite 2 para exibir o relatorio de kills e causas dos abates por jogo
- Digite 3 para exibir o ranking geral de kills dos players
- Digite 4 para gerar o arquivo de relatorio dos jogos, que fica no diretorio 'log'
- Digite 0 para finalizar a aplicação



##Exemplo de Impressões

### Informações sobre um jogo

```ruby 
Game_3 : {
 Total_kills: 4,
 Players : ["Dono da Bola", "Mocinha", "Isgalamido", "Zeh"]
 Kills: {
  Dono da Bola : -1
   Mocinha : 0
   Isgalamido : 1
   Zeh : -2
 
 }
}
```

### Relatorio de kills e causas dos abates

```ruby
Game 3:
PLAYER: Dono da Bola -1 KILLS
PLAYER: Mocinha 0 KILLS
PLAYER: Isgalamido 1 KILLS
PLAYER: Zeh -2 KILLS

Causas dos Abates:
Motivo: MOD_ROCKET 1 vezes
Motivo: MOD_TRIGGER_HURT 2 vezes
Motivo: MOD_FALLING 1 vezes
```


###Ranking geral dos players
```ruby
RANKING:
PLAYER: Isgalamido 150 KILLS
PLAYER: Zeh 124 KILLS
PLAYER: Oootsimo 114 KILLS
PLAYER: Assasinu Credi 111 KILLS
PLAYER: Dono da Bola 60 KILLS
PLAYER: Chessus 33 KILLS
PLAYER: Chessus! 0 KILLS
PLAYER: Maluquinho 0 KILLS
PLAYER: UnnamedPlayer 0 KILLS
PLAYER: Fasano Again 0 KILLS
PLAYER: Mocinha 0 KILLS
PLAYER: Mal -3 KILLS
```
