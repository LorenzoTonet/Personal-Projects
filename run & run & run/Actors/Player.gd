extends KinematicBody2D

const EndLevel= preload("res://Menu/End Level.tscn")

const UP = Vector2(0, -1)
const gravity = 20
const maxfallspeed = 400
const maxspeed = 230
const jumpforce = 550
const maxwallslide_speed = 120

var motion = Vector2()
var can_jump = false
var is_dead = false

var new_score



func _ready() -> void:
	pass


func _physics_process(delta):
	if is_dead == false :
	
		motion.y += gravity
		
		if motion.y  > maxfallspeed :
			motion.y = maxfallspeed
			
		if Input.is_action_pressed("move_right"):
			motion.x = maxspeed
		elif Input.is_action_pressed("move_left"):
			motion.x = -maxspeed
		else:
			motion.x = 0
			
		if Input.is_action_just_pressed("jump") && can_jump == true:
				
			motion.y = -jumpforce
			if is_on_wall() && Input.is_action_pressed("move_right"):
				motion.x = -maxspeed
			elif is_on_wall() && Input.is_action_pressed("move_left"):
				motion.x = maxspeed
			
			
		if is_on_floor():
			can_jump = true
		else:
			can_jump = false
		

		
		if is_on_wall() && (Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left") ):
			can_jump = true
			if motion.y >= 0:
				motion.y = maxwallslide_speed
			else:
				motion.y += gravity
		else:
			motion.y += gravity
		 
		if motion.y  > maxfallspeed :
			motion.y = maxfallspeed
		
		motion = move_and_slide(motion, UP)
	
func _on_Enemy_detect_area_entered(area):
	dead()
	
func dead():
	is_dead = true
	motion = Vector2(0,0)
	$Timer.start()
	get_parent().get_node("Timer2").timer_on = false
	new_score = get_parent().get_node("Timer2").time

func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://Menu/End Level.tscn")
	get_parent().queue_free()
	
	
