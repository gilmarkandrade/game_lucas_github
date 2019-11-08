extends Area2D



func _on_area_zoom_out_plataform_body_entered(body):
	if body.is_in_group("player"):
		$anim_camera_zoom.play("camera_zoom_out")


func _on_area_zoom_out_plataform_body_exited(body):
	if body.is_in_group("player"):
		$anim_camera_zoom.play_backwards("camera_zoom_out")
