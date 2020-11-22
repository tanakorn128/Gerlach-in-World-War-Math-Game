extends Node2D
signal Tree1
signal Tree2
signal Tree3
signal Tree4



func _on_Tree1_body_entered(body):
	emit_signal("Tree1")
	pass # Replace with function body.


func _on_Tree2_body_entered(body):
	emit_signal("Tree2")
	pass # Replace with function body.


func _on_Tree3_body_entered(body):
	emit_signal("Tree3")
	pass # Replace with function body.


func _on_Tree4_body_entered(body):
	emit_signal("Tree4")
	pass # Replace with function body.
