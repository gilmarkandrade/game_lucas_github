extends Area2D

var hit_wall = 0
var break_wall = atributos_fase_singleton.block_break

func _ready():
	
	if break_wall == true:
		$animation_block.current_animation = "destroy_block_finalized"
		

func _on_Parede_quebrada_area_entered(area):
	if area. is_in_group("arma_player") and break_wall == false :
		hit_wall += 1
		$particula_bloco.emitting = true
		if hit_wall >= 3:
			break_wall = true 
			$animation_block. play("destroy_block")
			atributos_fase_singleton.destroy_wall_fase_2(break_wall)
			$particula_bloco.emitting = true
			$particula_bloco.lifetime = 2