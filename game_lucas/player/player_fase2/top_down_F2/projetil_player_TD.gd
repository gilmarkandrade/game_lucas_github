extends Area2D
var motion = Vector2()
var speed = 8
var damage = 30
var target 
var pos

func _ready():
	
	atributos_player_singleton.subtract_mana_player(1)
	$sprite_projetil.visible= false
	
func _process(delta):
	
	motion = (target - pos) .normalized() * speed
	
	translate(motion)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_projetil_player_TD_body_entered(body):
	if body.is_in_group("enemie"):
		atributos_player_singleton.damage_life_enimie_update(damage)
		queue_free()


func _on_projetil_player_TD_area_entered(area):
	if area.name == "visibility_bullet":
		$sprite_projetil.visible = true
