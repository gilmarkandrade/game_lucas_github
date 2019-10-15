extends StaticBody2D

var life = 200
var break_tree = false
func damage_tree():
	if life <= 0:
		break_tree = true
		$animaton_tree.current_animation = "falling_down_tree"


func _on_corpo_arvore_area_entered(area):
	if area.is_in_group("arma_player") and break_tree == false:
		
		$animaton_tree.current_animation = "damage_tree"
		life -= atributos_player_singleton.life_enemie_update
		damage_tree()


func _on_delay_camera_shake_timeout():
	pass # Replace with function body.
