extends CollisionShape2D
var start = false

func _process(delta):
	if Input.is_action_just_pressed("ui_All"):
		start = true

func _on_Tree1_body_entered(body):
	if start:
		print("sss")
		$DialogBoxV3.send_dialogbox(1,2)
	pass # Replace with function body.
