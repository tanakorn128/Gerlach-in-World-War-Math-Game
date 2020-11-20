extends KinematicBody2D

var velocity = Vector2()
export var speed = 15000
signal InCollide
signal OutCollide
func _physics_process(delta):
	emit_signal("playerspotted","player in my area","player is the godot player")
	if Input.is_action_pressed("ui_left"):
		velocity.y = 0
		velocity.x = -speed
		$AnimatedSprite.play("left")
	elif Input.is_action_pressed("ui_right"):
		velocity.y = 0
		velocity.x = speed
		$AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y=-speed
		$AnimatedSprite.play("up")
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("down")
		velocity.x = 0
		velocity.y=speed
		
	else:
		velocity.y=0
		velocity.x=0
		$AnimatedSprite.play("idle")
	move_and_slide(velocity*delta)
	pass

func _on_Area2D_body_entered(body):
	emit_signal("InCollide")
	pass # Replace with function body.




func _on_Area2D_body_exited(body):
	emit_signal("OutCollide")
	pass # Replace with function body.
