extends MarginContainer

var level = Global.level_num

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1 :
		current_selection += 1
		set_current_selection(current_selection)
	
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0 :
		current_selection -= 1
		set_current_selection(current_selection)
		
	elif Input.is_action_just_pressed("ui_accept") :
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if current_selection == 0:
		if level == 1:
			get_tree().change_scene("res://Levels/Level 1.tscn")
			
		elif level == 2:
			get_tree().change_scene("res://Levels/Level 2.tscn")
			
		elif level == 3:
			get_tree().change_scene("res://Levels/Level 3.tscn")
		queue_free()
		
	elif current_selection == 1:
		get_tree().change_scene("res://Menu/MainMenu.tscn")
		queue_free()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if current_selection == 0:
		selector_one.text = ">"
	if current_selection == 1:
		selector_two.text = ">"
