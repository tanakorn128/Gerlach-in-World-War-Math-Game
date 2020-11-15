extends Node2D
func _process(delta):
	if Input.is_action_pressed("ui_interact"):
		get_tree().change_scene("res://src/mission/Battle.tscn")
	$NPC.text = "NPC"
	$Player.text = "Player"
func _ready():
	get_node("vs/HNPC/AnimationPlayer").play("NPC")
	get_node("vs/HPlayer/AnimationPlayer").play("VS")
	
	










func _on_Area2D2_area_entered(area):
	
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().change_scene("res://src/mission/mission1.tscn")
	pass # Replace with function body.
