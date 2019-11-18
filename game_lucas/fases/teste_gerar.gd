extends Node2D

var test = preload("res://fases/teste_gerar2.tscn")


func _on_top_body_entered(area):
	print(area)
	if area.is_in_group("player"):
		var t = test.instance()
		get_parent().add_child(t)
		t.position = $chao_spawn1.global_position
