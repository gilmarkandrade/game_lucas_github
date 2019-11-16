extends Area2D
var side
var motion = Vector2() 
var speed = 3
var mana_subtract = 3
var damage = 20
var stop = false


func _ready():
	atributos_player_singleton.subtract_mana_player(mana_subtract)

func _process(delta):
	
	if stop == false :
		move_projetil()

func move_projetil():

	if side == false :
		motion.x += speed 
	if side == true:
		motion.x -= speed 
	translate(motion)


func _on_orb__de_fogo_SD_area_entered(area):
	stop = true
	if area.is_in_group("enemie"):
		atributos_player_singleton.damage_life_enimie_update(damage)
	
	queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()