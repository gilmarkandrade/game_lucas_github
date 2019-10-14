extends Node
var mudarposicao
var  get_weapom_away= false


func setar_posicao(posicao):
	mudarposicao = posicao
# esta função passa ovalor de verdadiro caso ja tenha pego o cajado na fase 2 
# e se esse esse valor for verdadeiro a hud de mana ficara visisivel o valor dessa 
# funcao é recebida no script mana hud 
func weapon_away_status(in_hands):
	get_weapom_away = in_hands
