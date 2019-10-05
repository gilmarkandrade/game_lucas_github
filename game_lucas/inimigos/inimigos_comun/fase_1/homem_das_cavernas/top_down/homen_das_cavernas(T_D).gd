extends KinematicBody2D


var speed = 1.2
var seguir = false
var dano = 5
var move = Vector2(0,0)
var target = atributos_player_singleton.pos_player_update


	
	
func _process(delta):
	target = atributos_player_singleton.pos_player_update
	if seguir == false :
		perseguir(delta)
	
	
func init(pos):
	position = pos
 

# pega direcao menos a posiçaõ do player vezes a velocidade para seguir o player
func perseguir(delta):
	look_at(target)
	var direction = target - position 
	var motion = direction *speed* delta
	position += motion