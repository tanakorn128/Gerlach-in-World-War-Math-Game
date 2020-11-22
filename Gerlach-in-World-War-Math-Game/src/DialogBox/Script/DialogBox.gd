extends Node2D
signal End
func _ready():
	get_node("Text/AnimationPlayer").play("Present_Visible")
	pass



func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("End")
	pass # Replace with function body.
