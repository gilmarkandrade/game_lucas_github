extends Area2D

func _ready():
	$animation_icon.visible = false

func _on_icone_mudar_perspectiva_body_entered(body):
	if body.is_in_group("player"):
		$animation_icon.visible = true
		atributos_fase_singleton.permission_altered_cena(true)


func _on_icone_mudar_perspectiva_body_exited(body):
	if body.is_in_group("player"):
		$animation_icon.visible = false
		atributos_fase_singleton.permission_altered_cena(false)
