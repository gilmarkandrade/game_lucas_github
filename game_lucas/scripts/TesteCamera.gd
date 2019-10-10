extends Camera2D

var shake = 0
var magnitude_shake = 15

func _ready():
	set_process(true);
	pass

func _process(delta):
	#print(camera_shake_singleton.init_shake);
	#if(camera_shake_singleton.init_shake == true):
		#faz_shake_camera();
		#camera_shake_singleton.init_shake = false
		
	pass 
	
func faz_shake_camera():
	set_offset(Vector2(rand_range(-shake, shake), rand_range(-shake, shake)));
	shake *= 0.9;
	shake = magnitude_shake;
	pass