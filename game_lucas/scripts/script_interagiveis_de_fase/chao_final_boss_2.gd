extends StaticBody2D
var  floor_static

func _ready():
	var  floor_static = preload("res://boss_fase/chao_3/chao_final_boos_3.tscn")

func _on_area_criar_body_entered(body):
		if body.is_in_group("player"):
			instance_floor()


func _on_area_destruir_body_exited(body):
	if body.is_in_group("player"):
		$".".queue_free()

func instance_floor():
	var F_L = floor_static . instance()
	get_parent().add_child(F_L)
	F_L.position = $position_inicio_chao.global_position