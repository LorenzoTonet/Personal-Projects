extends Area2D


func _on_Spine_Hazards_body_entered(body):
	if body.is_in_group("Player"):
		body.dead()
