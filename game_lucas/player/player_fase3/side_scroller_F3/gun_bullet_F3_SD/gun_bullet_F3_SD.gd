extends Area2D
var side
var motion = Vector2() 
var speed = 3
var mana_subtract = 1
var damage = 30
var stop = false


func _ready():
	atributos_player_singleton.subtract_mana_player(mana_subtract)

func _process(delta):
	
	if stop == false :
		move_projetil()
	else :
		motion.x = 0 
func move_projetil():

	if side == false :
		motion.x += speed 
	elif side == true:
		motion.x -= speed 
	
	translate(motion)



	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_gun_bullet_F3_SD_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("bloqueio"):
		queue_free()


func _on_gun_bullet_F3_SD_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("enemie"):
		atributos_player_singleton.damage_life_enimie_update(damage)
		stop = true
		queue_free()
