extends Node



func _on_area_test_cajado_body_entered(body):
	atributos_fase_singleton.weapon_away_status(true)
	$area_test_cajado.queue_free()

