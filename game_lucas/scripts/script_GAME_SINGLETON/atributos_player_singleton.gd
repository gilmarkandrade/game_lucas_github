extends Node

var life_player = 100
var life_enemie_update = 0
var pos_player_update 
var camere_shake_update
var camera_zoom_update
var mana_player = 100
var fire_stop = false
var stop_player = false
var death_number = 0
var diag_bru_gameover = false

func stop_movement_player(stop):
	stop_player = stop

func player_life_update(life):
	life_player -=  life

func cont_death_player(death):
	death_number +=death
	
func damage_life_enimie_update(damage):
	life_enemie_update = damage
	
	
func update_position_player(pos_player):
	pos_player_update = pos_player
	
func aply_camera_shake(cam_init):
	camere_shake_update = cam_init
	
func aply_camera_zoom(zom_in_out):
	camera_zoom_update = zom_in_out
	
func subtract_mana_player(mana_valueN):
	mana_player -=  mana_valueN

	if mana_player <= 0:
		fire_stop = true
	if mana_player >= 5:
		fire_stop = false
		