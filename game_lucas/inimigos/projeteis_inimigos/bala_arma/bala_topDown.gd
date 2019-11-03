extends Area2D



#em desesnvolvimento

var target = Vector2()
var motion = Vector2()
var damage = 5
var seguir = false
var speed = 10



func _ready():
	
	look_at(target)

	
	#direction = target 
	#motion = direction * speed

func pos_arrow_parameter(posshoot):
	
	target = posshoot
	


func _process(delta):
	
	
	
	motion = (target - position) .normalized() * speed
	
	translate(motion)


func _on_flecha_topDown_body_entered(body):
	
	if body.is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		queue_free()
		

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
