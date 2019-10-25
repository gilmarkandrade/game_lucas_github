extends Area2D



#em desesnvolvimento

var target = atributos_player_singleton.pos_player_update
var motion 
var damage = 3
var direction = target - position
var speed = 0.2

func _ready():
	target = atributos_player_singleton.pos_player_update
	look_at(target)
	
	#direction = target 
	#motion = direction * speed


func _process(delta):
	
	motion =  target * speed  
	
	translate(motion)

func _on_flecha_topDown_body_entered(body):
	if body.is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
