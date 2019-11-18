extends KinematicBody2D


var death = false 
var walking = true 
var atacking = false
var idlle_status = true
var life = 1000
var damage = 5 
var move = Vector2()
var velocity = 50
var attack_probability = RandomNumberGenerator.new()
var attack_type = 0
var can_change = false
var shot = preload("res://inimigos/projeteis_inimigos/shot_final_boss/shot.tscn")
var missil = preload("res://inimigos/projeteis_inimigos/missil_final_boss/side_scroll/Missil.tscn")
var laser = preload("res://inimigos/projeteis_inimigos/laser_final_boss/laser.tscn")
var impulse = false

const gravity = 9

#em desenvolvimento
func _physics_process(delta):
	life = atributos_final_boss_singleton.life_boss
	move.y += gravity
	walking_mech()
	if impulse == true:
		impulseTop()

func walking_mech():
	if walking == true:
		move.x = 8
		$animation.current_animation = "walk_animaton"
		$delay_attack1.paused
	else :
		move.x = 0
		$delay_attack1.start()
		if atacking == false and walking == false and idlle_status == true:
			$animation.current_animation = "idlle_animation"

	move = move_and_slide(move)

func random_attack():
	attack_probability.randomize()
	attack_type = attack_probability.randi_range(1,2)

func generate_attack():
	atacking = true
	if can_change == false:
		random_attack()
		can_change = true
	walking = false
	#if attack_type == 1 :
	#$delay_attack2.start()
	#$animation.current_animation = "missil_attack"
	#if attack_type == 2 :
	#$delay_attack3.start()
	#$animation.current_animation = "medium_charge"
	#if attack_type == 3 :
	$delay_attack4.start()
	$animation.current_animation = "laser_down"

func attack1():
	var TIRO = shot.instance()
	get_parent().add_child(TIRO)
	TIRO.position = $cannon_fire.global_position
	$delay_attack1.start()

func attack4():
	var LAS = laser.instance()
	get_parent().add_child(LAS)
	LAS.scale.y = 4
	LAS.position = $cannon_fire_down.global_position
	$reload.start()
	impulse = true
	$impulse.start()

func attack2():
	var DIS1 = missil.instance()
	get_parent().add_child(DIS1)
	DIS1.M1 = true
	DIS1.position = $missile_launcher.global_position
	
	var DIS2 = missil.instance()
	get_parent().add_child(DIS2)
	DIS2.M2 = true
	DIS2.position = $missile_launcher.global_position
	
	var DIS3 = missil.instance()
	get_parent().add_child(DIS3)
	DIS3.M3 = true
	DIS3.position = $missile_launcher.global_position
	$reload.start()


func attack3():
	var LAS = laser.instance()
	get_parent().add_child(LAS)
	LAS.position = $cannon_fire.global_position
	$reload.start()
	impulse = true
	$impulse.start()


func _on_delay_attack1_timeout():
	$delay_attack1.stop()
	attack1()

func _on_delay_attack2_timeout():
	$delay_attack2.stop()
	attack2()

func _on_delay_attack3_timeout():
	$delay_attack3.stop()
	attack3()

func _on_delay_attack4_timeout():
	$delay_attack4.stop()
	attack4()

#func _on_animation_H_C_animation_finished(anim_name):
#	if anim_name == "death_animation":
#		queue_free()


func _on_change_attack_timeout():
	generate_attack()
	can_change = false
	$change_attack.stop()
	


func _on_area_corpo_mech_area_entered(area):
	if area.is_in_group("arma_player") and death == false:
		life -= 50
		$animation.current_animation = "tween"
		#life -= atributos_player_singleton.life_enemie_update
	if area.is_in_group("projetil_player") and death == false:
		life -= 50
		$animation.current_animation = "tween"
		#life -= atributos_player_singleton.life_enemie_update
	atributos_final_boss_singleton.life_boss = life
	action_life()


func action_life():
	
	if life <= 750 and life >= 500:
		get_tree().change_scene("res://fases/TesteFinalBoss(TD).tscn")
	elif life < 500 and life >= 250:
		print("tooop")



func _on_reload_timeout():
	$reload.stop()
	walking = true
	atacking = false
	$change_attack.start()

func impulseTop():
	move.x = 12
	move = move_and_slide(move)

func _on_impulse_timeout():
	impulse = false
	$impulse.stop()



func _on_reload_shoot_timeout():
	$reload_shoot.stop()
	walking = true
	atacking = false
	$change_attack.start()