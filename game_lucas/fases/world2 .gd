extends Node

var entrou_na_area2 = false

func _ready():
	$Label.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area2 = true
		$Label.visible = true


func _on_Area2D_body_exited(body):
	if body.name == "player_top_down":
		entrou_na_area2 = false
		$Label.visible = false



func _physics_process(delta):
	if entrou_na_area2 == true:
		if Input.is_action_pressed("ui_accept"):
			singletonfase.setar_posicao(entrou_na_area2)
			get_tree().change_scene("res://fases/world.tscn")