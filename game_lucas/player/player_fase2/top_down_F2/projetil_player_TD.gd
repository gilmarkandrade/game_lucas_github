extends Area2D
var motion = Vector2()
var speed = 6
var target = get_global_mouse_position() 

func _ready():
	target
	atributos_player_singleton.subtract_mana_player(5)
	
func _process(delta):
	
	motion = (target *100 - position) .normalized() * speed
	
	translate(motion)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
