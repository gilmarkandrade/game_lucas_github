extends RigidBody2D



func _ready():
	$mesa_animation.play("idlle")
	
func _on_mesa_area_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("projetil_player"):
		$mesa_animation.play("table_break")
	elif area.is_in_group("arma_player"):
		$mesa_animation.play("table_break")

func _on_mesa_animation_animation_finished(anim_name):
	if anim_name == "table_break":
		queue_free()
