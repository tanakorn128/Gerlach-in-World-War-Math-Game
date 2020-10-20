extends KinematicBody2D
var zoom_step = 1.1
var velocity = Vector2()
export var speed = 10000
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false	
		$AnimatedSprite.play("walk")
	else:
		velocity.x=0
		$AnimatedSprite.play("idle")
	if Input.is_action_pressed("ui_up"):
		velocity.y=-speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y=speed
	else:
		velocity.y=0
	move_and_slide(velocity*delta)
	
	pass

