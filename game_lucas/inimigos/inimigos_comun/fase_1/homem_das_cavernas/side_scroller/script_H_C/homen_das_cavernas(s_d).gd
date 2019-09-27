extends KinematicBody2D
var death = false 
var walking = false 
var atacking = false
var right_side = false
var left_side= false
var life = 100
var damage = 5 
var move = Vector2()
var velocity = 8



func walk_left_right_side():
	if left_side == true and atacking == false and walking == true:
		move.x -= velocity
		$animation_H_C.current_animation = "walk_animaton"
		$sprite_H_C.flip_h = true
	elif right_side == true and atacking == false and walking == true :
		move.x += velocity
		$sprite_H_C.flip_h = false
		
	else :
		move.x
		if atacking == false:
			$animation_H_C.current_animation = "idlle_animation"

func atack():
	if left_side == true and atacking == true:
		move.x == 0
		atributos_player_singleton.player_
		$animation_H_C.play("atack_animation")

