extends Control

func _ready():
	
	pass

func _on_Jogar_pressed():
	get_tree().change_scene("res://assets_game/cutscene/cutscene_comeco/protagonista/comeco.tscn")
	pass

func _on_Sair_pressed():
	get_tree().quit()
	pass