extends Node

var life_player = 100
var life_enemie_update = 0
var pos_player_update 

func player_life_update(life):
	life_player -=  life


func damage_life_enimie_update(damage):
	life_enemie_update = damage
	
func update_position_player(pos_player):
	pos_player_update = pos_player