extends KinematicBody2D

var move = Vector2()
var speed = 30
const jump_force = -300

const gravity = 9

const UP = Vector2(0,-1)


func _physics_process(delta):
	move.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		move.x += speed
		$CollisionShape2D/icon2.flip_h= true
	elif Input.is_action_pressed("ui_left"):
		move.x -= speed
		$CollisionShape2D/icon2.flip_h= false
	else:
		move.x = 0
		if is_on_floor():
			if Input. is_action_just_pressed("ui_up"):
				move.y = jump_force
	move = move_and_slide(move,UP)