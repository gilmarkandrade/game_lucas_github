extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_custom_mouse_cursor(null)
	$CanvasLayer/Jogar.grab_focus()
	pass

func _on_Jogar_pressed():
	get_tree().change_scene("res://assets_game/cutscene/cutscene_comeco/protagonista/comeco.tscn")
	pass

func _on_Sair_pressed():
	get_tree().quit()
	pass


func _on_BT_BR_pressed():
	TranslationServer.set_locale("pt_BR")


func _on_BT_EN_pressed():
	TranslationServer.set_locale("en")
