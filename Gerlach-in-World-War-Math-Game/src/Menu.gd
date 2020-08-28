extends Node2D



func _on_Button_pressed():
	get_tree().quit()



func _on_start_game_pressed():
	get_tree().change_scene("res://src/Map.tscn")
