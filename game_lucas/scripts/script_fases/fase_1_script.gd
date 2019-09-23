extends Node
var entrou_na_area = false
var novapos= false

func _on_Area2D_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area = true
		$Label.visible = true



func _on_Area2D_body_exited(body):
	if body.name == "player_plataforma":
		entrou_na_area = false
		$Label.visible= false
		

func _physics_process(delta):
	if entrou_na_area == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_1/world_1_cena_2.tscn")
	
	
func _ready():
	novapos = singletonfase.mudarposicao 
	$Label.visible = false
	if novapos == true:
		$player_plataforma.position = $Position2D.global_position
	
