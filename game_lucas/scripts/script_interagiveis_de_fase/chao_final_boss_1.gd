extends StaticBody2D
var motion = Vector2()
var seguir = false

func _process(delta):
	if seguir == false:
		motion.x = + 1
	
	
	translate(motion)