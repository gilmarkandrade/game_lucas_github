extends Node
var mudarposicao
var  get_weapom_away = false
var fase_restart = 0
var stop_spawn_enemie = false
var cont_enemie 
var enemie_limit_in_game = 0

func setar_posicao(posicao):
	mudarposicao = posicao
# esta função passa ovalor de verdadeiro caso ja tenha pego o cajado na fase 2 
# e se esse esse valor for verdadeiro a hud de mana ficara visisivel o valor dessa 
# funcao é recebida no script mana hud 
func weapon_away_status(in_hands):
	get_weapom_away = in_hands

#contador de inimigo na fase quando todos inimigos forem mortos ele para de spawn
func update_enemie_dead(enemie_N):
	
	cont_enemie -= enemie_N
	
	if cont_enemie <= 0: 
		stop_spawn_enemie = true
		

# estas funcoes add ou subtraem o limite de inimigos que pode spawn na cena  

func subtract_enemie_ingame(enemiesub):
	enemie_limit_in_game -= enemiesub 
	
func add_enemie_limit_in_game(enemieadd):
	enemie_limit_in_game += enemieadd