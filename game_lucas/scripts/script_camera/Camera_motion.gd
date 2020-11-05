extends Camera2D

var shake = 0
var magnitude_shake = 15
var play_shake = false
var play_zoom
var zoom_y = zoom.y
var zoom_x = zoom.x

func _ready():
	set_process(true);
	pass

func _process(delta):
	play_shake = atributos_player_singleton.camere_shake_update
	make_zoom_camera()
	if play_shake == true:
		make_shake_camera()
		
	#print(camera_shake_singleton.init_shake);
	#if(camera_shake_singleton.init_shake == true):
		#faz_shake_camera();
		#camera_shake_singleton.init_shake = false
		

	
func make_shake_camera():
	set_offset(Vector2(rand_range(-shake, shake), rand_range(-shake, shake)));
	shake *= 0.9;
	shake = magnitude_shake;
	
	
func make_zoom_camera():
	play_zoom = atributos_player_singleton.camera_zoom_update
	
	if play_zoom ==1 :
		zoom.y = zoom_y /1.2
		zoom.x = zoom_x /1.2
		play_zoom +=1
		atributos_player_singleton.aply_camera_zoom(play_zoom)
	if play_zoom == 4:
		zoom.y = zoom_y 
		zoom.x = zoom_x 
		play_zoom +=1
		atributos_player_singleton.aply_camera_zoom(play_zoom)
