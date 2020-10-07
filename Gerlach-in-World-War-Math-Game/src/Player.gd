extends KinematicBody2D
var velocity = Vector2()
var speed = 1000
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x=0
	if Input.is_action_pressed("ui_up"):
		velocity.y=-speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y=speed
	else:
		velocity.y=0
	
	move_and_slide(velocity)
	
	pass

