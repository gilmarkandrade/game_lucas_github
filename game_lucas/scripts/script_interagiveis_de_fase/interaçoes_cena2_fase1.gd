extends Node

func _ready():
	if atributos_fase_singleton.homen_das_cavernas_dead == true:
		$"../homen_das_cavernas(T_D)".queue_free()