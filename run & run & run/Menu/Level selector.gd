extends MarginContainer

const lv1 = preload("res://Levels/Level 1.tscn")
const lv2 = preload("res://Levels/Level 2.tscn")
const lv3 = preload("res://Levels/Level 3.tscn")


onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/selector
onready var selector_esc = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 3 :
		current_selection += 1
		set_current_selection(current_selection)
	
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0 :
		current_selection -= 1
		set_current_selection(current_selection)
		
	elif Input.is_action_just_pressed("ui_accept") :
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if current_selection == 0:
		get_parent().add_child(lv1.instance())
		Global.level_num = 1
		queue_free()
		
	elif current_selection == 1:
		get_parent().add_child(lv2.instance())
		Global.level_num = 2
		queue_free()
		
	elif current_selection == 2:
		get_parent().add_child(lv3.instance())
		Global.level_num = 3
		queue_free()
		
	elif current_selection == 3:
		get_tree().change_scene("res://Menu/MainMenu.tscn")
		queue_free()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_esc.text = ""
	
	if current_selection == 0:
		selector_one.text = ">"
	if current_selection == 1:
		selector_two.text = ">"
	if current_selection == 2:
		selector_three.text = ">"
	if current_selection == 3:
		selector_esc.text = ">"
