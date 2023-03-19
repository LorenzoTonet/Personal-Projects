extends MarginContainer



const room_select = preload("res://Menu/Level selector.tscn")
const controls = preload("res://Menu/Controls.tscn")

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2 :
		current_selection += 1
		set_current_selection(current_selection)
	
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0 :
		current_selection -= 1
		set_current_selection(current_selection)
		
	elif Input.is_action_just_pressed("ui_accept") :
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if current_selection == 0:
		get_parent().add_child(room_select.instance())
		queue_free()
		
	elif current_selection == 1:
		get_tree().quit()
	
	elif current_selection == 2:
		get_parent().add_child(controls.instance())
		queue_free()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if current_selection == 0:
		selector_one.text = ">"
	if current_selection == 1:
		selector_two.text = ">"
	if current_selection == 2:
		selector_three.text = ">"
