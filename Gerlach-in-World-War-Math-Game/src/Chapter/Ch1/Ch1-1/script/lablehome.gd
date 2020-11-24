extends CollisionShape2D
var start = false
func _unhandled_input(event):
	if event.is_action_pressed("ui_All"):
		start = true
func _on_lablehome_body_entered(body):
	if start:
		$DialogBoxV3.send_dialogbox(1,2)
	pass # Replace with function body.
