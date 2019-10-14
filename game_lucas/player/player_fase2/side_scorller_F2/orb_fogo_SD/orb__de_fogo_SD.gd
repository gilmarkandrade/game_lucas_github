extends Area2D
var side
var motion = Vector2() 
var speed = 3
var mana_subtract = 20


func _ready():
	atributos_player_singleton.subtract_mana_player(mana_subtract)

func _process(delta):
	
	move_projetil()

func move_projetil():

	if side == false :
		motion.x += speed 
	if side == true:
		motion.x -= speed 
	translate(motion)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
