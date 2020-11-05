extends Node2D

var walking




func _process(delta):
	print($player_top_down_F5.move.y)
	if $player_top_down_F5.global_position.y <= 100:
		$player_top_down_F5.position.y += 5
	if $player_top_down_F5.global_position.y >= 550:
		$player_top_down_F5.position.y -= 5
	pass
