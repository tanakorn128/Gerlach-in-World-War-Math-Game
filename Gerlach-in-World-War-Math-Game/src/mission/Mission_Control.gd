extends Node2D
func _process(delta):
	if Input.is_action_pressed("ui_interact"):
		get_tree().change_scene("res://src/mission/Battle.tscn")
	$NPC.text = "NPC"
	$Player.text = "Player"
